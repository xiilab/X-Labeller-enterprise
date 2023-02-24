package com.xlabeller.common.module;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.enums.PathEnum;
import com.xlabeller.models.ImExportVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.opencv.core.*;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.*;

import static org.opencv.imgproc.Imgproc.*;

public class VocExportUtil {
    static {
        nu.pattern.OpenCV.loadShared();
        System.loadLibrary(org.opencv.core.Core.NATIVE_LIBRARY_NAME);
    }
    // Annotation디렉토리에 저장할 Map(key : fileName, value : xml로 작성할 문자열 baos)
    private Map<String, byte[]> exportVocXmlMap;
    // 이미지 정보 저장된 Map(key : fileName, value : ex) {width : 100, height : 100})
    private Map<String, JSONObject> allImageInfoMap;
    // ImageSets/Main 디렉토리에 저장할 파일 map, JPEGImages 디렉토리에 저장할 파일 map
    // (key : fileName, value : filePath)
    private Map<String, String> exportAllImageNameMap;
    // ImageSets/Segmentation 디렉토리에 저장할 파일명 Map(key : fileName, value : ex) [{points : [x(1), y(1), x(2), y(2), x(3), y(3), ...]}])
    private Map<String, JSONArray> exportSegImageLabelInfoMap;
    // 이미지에 생성된 라벨 바운딩박스 좌표정보가 저장된 Map(key : fileName, value : ex) {label : 'untag', bbox: [x1, y1, x2, y2]})
    private Map<String, JSONArray> imageLabelMappingMap;
    // SegmentationObject 디렉토리에 저장할 파일 Map(key : fileName, value : openCV로 추출한 byte[])
    private Map<String, byte[]> exportSegObjectImageMap;

    public VocExportUtil() {
        this.exportVocXmlMap = new HashMap<>();
        this.exportAllImageNameMap = new HashMap<>();
        this.exportSegImageLabelInfoMap = new HashMap<>();
        this.exportSegObjectImageMap = new HashMap<>();
    }

    public void createData(List<ImExportVO> annotationList) throws IOException {
        initData(annotationList);
        createVocXml();
        createSegmentationObjectFile();
    }

    private void initData(List<ImExportVO> annotationList) {
        Map<String, String> allImageNameMap = new HashMap<>();
        Map<String, JSONArray> segImageLabelInfoMap = new HashMap<>();
        Map<String, JSONObject> allImageInfoMap = new HashMap<>();
        // 모든 이미지와 매핑되는 라벨명, 바운딩박스 좌표정보가 저장된 Map(key : 파일명, value : ex) {label : 'untag', bbox: [x1, y1, x2, y2]})
        Map<String, JSONArray> imageLabelMappingMap = new HashMap<>();

        for (ImExportVO imExportVO : annotationList) {
            // 서버에 저장된 파일명
            String fileName = imExportVO.getPath().split("/")[1].split("\\.")[0];

            // 서버에 저장된 파일 경로
            String fullFileName = PathEnum.WORKSPACE_PATH.getPath() + PathEnum.NFS_MOUNT_ROOT_PATH.getPath() + "/" + imExportVO.getPath();
            // 이미지 width, height
            String imageWidth = String.valueOf(imExportVO.getWidth());
            String imageHeight = String.valueOf(imExportVO.getHeight());
            // 라벨타입, 라벨명, 라벨 Info
            String labelType = imExportVO.getLabel_type();
            String labelName = imExportVO.getLabel();
            String labelInfo = imExportVO.getInfo();

            // 모든 이미지에 대한 실제 파일 경로명 추가
            allImageNameMap.put(fileName, fullFileName);
            // 모든 이미지에 대한 이미지 정보 추가
            addImageInfoMap(allImageInfoMap, fileName, imageWidth, imageHeight);
            // 모든 이미지에 존재하는 라벨 정보 추가
            addImageLabelMap(imageLabelMappingMap, fileName, labelType, labelName, labelInfo);
            if("IMAGE_SEGMENTATION".equals(labelType)) {
                addSegImageLabelInfoMap(segImageLabelInfoMap, labelInfo, fileName);
            }
        }

        this.exportAllImageNameMap = allImageNameMap;
        this.exportSegImageLabelInfoMap = segImageLabelInfoMap;
        this.allImageInfoMap = allImageInfoMap;
        this.imageLabelMappingMap = imageLabelMappingMap;
    }

    private void addSegImageLabelInfoMap(Map<String, JSONArray> segImageLabelInfoMap, String info, String fileName) {
        // 세그멘테이션 값 가져옴
        JSONParser jsonParser = new JSONParser();
        JSONArray infoArray = null;
        try {
            infoArray = (JSONArray)jsonParser.parse(info);
        } catch (ParseException e) {
            throw new HandlerCustomException("500", "라벨 정보를 파싱하는 중 오류가 발생했습니다.");
        }
        JSONObject infoObj = (JSONObject) infoArray.get(0);
        JSONArray infoSegmentationArray = (JSONArray) infoObj.get("segmentation");

        // 세그멘테이션의 좌표값 가져와서 double[]형태로 변환
        List<Double> objectPointsList = new ArrayList<>();
        for(int i = 0; i < infoSegmentationArray.size(); i++) {
            JSONObject infoSegObj = (JSONObject) infoSegmentationArray.get(i);
            double x = Math.floor((double)infoSegObj.get("x") * 10) / 10;
            double y = Math.floor((double)infoSegObj.get("y") * 10) / 10;
            objectPointsList.add(x);
            objectPointsList.add(y);
        }
        double[] objectPointsArr = objectPointsList.stream().mapToDouble(Double::doubleValue).toArray();
        // double[]형태로 변환된 배열 json에 넣음
        JSONObject pointsInfoObj = new JSONObject();
        pointsInfoObj.put("points", objectPointsArr);

        JSONArray valueArray = new JSONArray();
        // 동일한 이미지에 이미 추가된 라벨 있으면 가져와서 add
        if(segImageLabelInfoMap.containsKey(fileName)) {
            valueArray = segImageLabelInfoMap.get(fileName);
            valueArray.add(pointsInfoObj);
        } else {
            valueArray.add(pointsInfoObj);
        }

        segImageLabelInfoMap.put(fileName, valueArray);
    }

    private void addImageLabelMap(Map<String, JSONArray> imageLabelMappingMap, String fileName, String labelType, String label, String info) {
        JSONObject jsonObject = new JSONObject();
//        String label = imExportVO.getLabel();
        if("IMAGE_BBOX".equals(labelType)) {
            JSONObject bbox = getBboxInfoToStringArray(info);
            jsonObject.put("label", label);
            jsonObject.put("bbox", bbox);
        } else {
            JSONParser jsonParser = new JSONParser();
            JSONArray segInfoJsonArray = null;
            try {
                segInfoJsonArray = (JSONArray)jsonParser.parse(info);
            } catch (ParseException e) {
                throw new HandlerCustomException("500", "XML파일을 생성하는 중 오류가 발생했습니다.");
            }
            JSONObject segInfoObj = (JSONObject) segInfoJsonArray.get(0);
            String bboxInfo = (String) segInfoObj.get("box");
            JSONObject bbox = getBboxInfoToStringArray(bboxInfo);
            jsonObject.put("label", label);
            jsonObject.put("bbox", bbox);
        }

        if(imageLabelMappingMap.containsKey(fileName)) {
            imageLabelMappingMap.get(fileName).add(jsonObject);
        } else {
            imageLabelMappingMap.put(fileName, new JSONArray());
            imageLabelMappingMap.get(fileName).add(jsonObject);
        }
    }

    private JSONObject getBboxInfoToStringArray(String imExportVO) {
        JSONObject resultObj = new JSONObject();
        String[] bboxInfo = imExportVO.split(",");
        int x1 = (int)Math.floor(Double.parseDouble(bboxInfo[0]));
        int y1 = (int)Math.floor(Double.parseDouble(bboxInfo[1]));
        int width = (int)Math.floor(Double.parseDouble(bboxInfo[2]));
        int height = (int)Math.floor(Double.parseDouble(bboxInfo[3]));
        int x2 = x1 + width;
        int y2 = y1 + height;
        resultObj.put("xmin", String.valueOf(x1));
        resultObj.put("ymin", String.valueOf(y1));
        resultObj.put("xmax", String.valueOf(x2));
        resultObj.put("ymax", String.valueOf(y2));
        //String[] bbox = new String[]{String.valueOf(x1), String.valueOf(y1), String.valueOf(x2), String.valueOf(y2)};
        return resultObj;
    }

    private void addImageInfoMap(Map<String, JSONObject> allImageInfoMap, String fileName, String imageWidth, String imageHeight) {
        JSONObject imageInfoJsonObj = new JSONObject();
        imageInfoJsonObj.put("width", imageWidth);
        imageInfoJsonObj.put("height", imageHeight);
        allImageInfoMap.put(fileName, imageInfoJsonObj);
    }

    private void createVocXml() {
        Map<String, byte[]> exportVocXmlMap = new HashMap<>();
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = null;
        try {
            dBuilder = dbFactory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            throw new HandlerCustomException("500", "XML파일을 생성하던 중 오류가 발생했습니다.");
        }

        //allImageInfoMap
        for(Map.Entry<String, JSONObject> entry: allImageInfoMap.entrySet()) {
            String fileNameStr = entry.getKey();
            JSONObject fileInfo = (JSONObject)entry.getValue();
            Document doc = dBuilder.newDocument();
            // 루트 엘리먼트 생성
            Element rootElement = doc.createElement("annotation");
            doc.appendChild(rootElement);

            // folder 엘리먼트 생성
            Element folder = doc.createElement("folder");
            folder.appendChild(doc.createTextNode("VOC"));
            rootElement.appendChild(folder);

            // filename 엘리먼트 생성
            Element fileName = doc.createElement("fileName");
            fileName.appendChild(doc.createTextNode(fileNameStr));
            rootElement.appendChild(fileName);

            // size 엘리먼트 생성
            Element size = doc.createElement("size");
            // size - width 엘리먼트 생성
            Element width = doc.createElement("width");
            width.appendChild(doc.createTextNode((String)fileInfo.get("width")));
            // size - height 엘리먼트 생성
            Element height = doc.createElement("height");
            height.appendChild(doc.createTextNode((String)fileInfo.get("height")));
            size.appendChild(width);
            size.appendChild(height);
            rootElement.appendChild(size);

            // segemnted 엘리먼트 생성, 세그멘테이션 있으면 1, 없으면 0
            Element segmented = doc.createElement("segmented");
            segmented.appendChild(doc.createTextNode(exportSegImageLabelInfoMap.containsKey(fileNameStr)? "1" : "0"));
            rootElement.appendChild(segmented);
            // Object 엘리먼트 생성
            JSONArray objectValueArray = imageLabelMappingMap.get(fileNameStr);
            for(int i = 0; i < objectValueArray.size(); i++) {
                // {label : "", box : ["[x1]","[y2]","[x2]","[y2]"]}
                JSONObject objectValue = (JSONObject) objectValueArray.get(i);
                String label = (String)objectValue.get("label");
                JSONObject box = (JSONObject)objectValue.get("bbox");
                // Object 엘리먼트 생성
                Element object = doc.createElement("object");
                // Object - name 엘리먼트 생성
                Element name = doc.createElement("name");
                name.appendChild(doc.createTextNode(label));
                object.appendChild(name);
                // Object - bndbox 엘리먼트 생성
                Element bndbox = doc.createElement("bndbox");
                // Object - bndbox - xmin 엘리먼트 생성
                Element xmin = doc.createElement("xmin");
                xmin.appendChild(doc.createTextNode((String)box.get("xmin")));
                bndbox.appendChild(xmin);
                // Object - bndbox - ymin 엘리먼트 생성
                Element ymin = doc.createElement("ymin");
                ymin.appendChild(doc.createTextNode((String)box.get("ymin")));
                bndbox.appendChild(ymin);
                // Object - bndbox - xmax 엘리먼트 생성
                Element xmax = doc.createElement("xmax");
                xmax.appendChild(doc.createTextNode((String)box.get("xmax")));
                bndbox.appendChild(xmax);
                // Object - bndbox - ymax 엘리먼트 생성
                Element ymax = doc.createElement("ymax");
                ymax.appendChild(doc.createTextNode((String)box.get("ymax")));
                bndbox.appendChild(ymax);

                object.appendChild(bndbox);
                rootElement.appendChild(object);
            }

            // xml 파일 ByteArrayOutputStream로 변환
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            try {
                Transformer transformer = transformerFactory.newTransformer();
                transformer.setOutputProperty(OutputKeys.INDENT, "yes");
                transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
                transformer.transform(new DOMSource(doc), new StreamResult(outputStream));
            } catch (Exception e) {
                throw new HandlerCustomException("500", "XML파일을 생성하던 중 오류가 발생했습니다.");
            } finally {
                // 파일로 저장
//                try {
//                    FileOutputStream fos = new FileOutputStream("/Users/juno/Desktop/xml/" + fileNameStr + ".xml");
//                    outputStream.writeTo(fos);
//                    fos.close();
//                } catch (IOException e) {
//                    throw new RuntimeException(e);
//                }
                exportVocXmlMap.put(fileNameStr, outputStream.toByteArray());

            }
        }

        this.exportVocXmlMap = exportVocXmlMap;
    }

    public void createSegmentationObjectFile() {
        Random rand = new Random();
        Map<String, byte[]> exportSegObjectImageMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        List<List<MatOfPoint>> resultList = new ArrayList<>();
        //Map(key : fileName, value : ex) [{points : [x(1), y(1), x(2), y(2), x(3), y(3), ...]}])
        for(Map.Entry<String, JSONArray> entry: exportSegImageLabelInfoMap.entrySet()) {
            String fileName = entry.getKey();
            JSONArray segInfoArray = entry.getValue();
            String fullFileName = exportAllImageNameMap.get(fileName);

            // 이미지 행렬 변환
            // 원본 이미지
            Mat originalImage = Imgcodecs.imread(fullFileName);
            // 폴리곤 생성하고 윤곽선을 찾을 이미지
            // CvType.CV_8U? 흑백이미지로 표현하기 위해 사용되는 타입, 윤곽선을 찾는 함수는 CvType.CV_8U형식의 이미지만 지원함
            Mat maskImage = Mat.zeros(originalImage.size(), CvType.CV_8U);
            // 윤곽선 + 폴리곤이 그려져 저장될 이미지
            Mat drawing = Mat.zeros(originalImage.size(), originalImage.type());
            for(int i = 0; i < segInfoArray.size(); i++) {
                JSONObject segInfoObj = (JSONObject)segInfoArray.get(i);
                double[] segInfo = (double[]) segInfoObj.get("points");
                // 이미지에 그려질 폴리곤
                MatOfPoint polygon = new MatOfPoint();
                // 폴리곤으로 생성할 좌표 목록
                List<Point> points = new ArrayList<>();
                Point point = new Point();
                for(int j = 0; j < segInfo.length; j++) {
                    if(j % 2 == 0) {
                        point.x = segInfo[j];
                    } else {
                        point.y = segInfo[j];
                        points.add(point);
                        point = new Point();
                    }
                }

                polygon.fromList(points);
                Scalar color = new Scalar(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));
                // 이미지에 폴리곤 그리기
                Imgproc.fillConvexPoly(maskImage, polygon, color, LINE_8);

                // 윤곽선 그리기 로직
                List<MatOfPoint> contours = new ArrayList<>();
                Mat hierarchy = new Mat();
                // 위에 폴리곤 생성된 이미지에서 윤곽선 찾기
                Imgproc.findContours(maskImage, contours, hierarchy, RETR_TREE, CHAIN_APPROX_SIMPLE);
                // 찾은 윤곽선 그리기
                // 윤곽선 및 폴리곤 그리기
                for (int j = 0; j < contours.size(); j++) {
                    Imgproc.drawContours(drawing, contours, j, new Scalar(255,255,255), 8, LINE_8, hierarchy, 0, new Point());
                    Imgproc.fillConvexPoly(drawing, polygon, color, LINE_8);
                }
            }

            // 저장될 이미지 읽어서 byte[]로 변환
            MatOfByte matOfByte = new MatOfByte();
            Imgcodecs.imencode(".png", drawing, matOfByte);
            byte[] byteArray = matOfByte.toArray();
            exportSegObjectImageMap.put(fileName, byteArray);
            // 바이트 배열을 파일로 저장
//             FileOutputStream fos = new FileOutputStream("/Users/juno/Desktop/xml/" + fileNameStr + ".xml");
//            try (FileOutputStream fos = new FileOutputStream("/Users/juno/Desktop/xml/" + fileName + ".png")) {
//                fos.write(byteArray);
//            } catch (FileNotFoundException e) {
//                throw new RuntimeException(e);
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
        }
        this.exportSegObjectImageMap = exportSegObjectImageMap;
    }

    public Map<String, byte[]> getExportVocXmlMap() {
        return exportVocXmlMap;
    }

    public Map<String, String> getExportAllImageNameMap() {
        return exportAllImageNameMap;
    }

    public Map<String, JSONArray> getExportSegImageLabelInfoMap() {
        return exportSegImageLabelInfoMap;
    }

    public Map<String, byte[]> getExportSegObjectImageMap() {
        return exportSegObjectImageMap;
    }
}