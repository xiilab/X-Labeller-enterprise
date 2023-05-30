package com.xlabeller.common.module;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.enums.PathEnum;
import com.xlabeller.enums.VocDirEnum;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.opencv.core.*;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class VocImportUtil {
    // 클라이언트에서 전달받은 voc형식의 zip파일
    private MultipartFile vocZipFile;
    // import할 확장자를 제외한 모든 이미지 파일명이 담겨있는 List, VOC/Imagesets/main의 txt파일을 읽어 생성된 결과
    // IMAGE_BBOX import할 때, 필요
    // private List<String> importVocImageSetsMainList;
    // import할 확장자를 제외한 세그멘테이션이 생성된 이미지 파일명이 담겨있는 List, VOC/Imagesets/Segmentation의 txt파일을 읽어 생성된 결과
    // IMAGE_SEGMENTATION import할 때, 필요
    // private List<String> importVocImageSetsSegList;
    // import할 이미지 경로가 담겨있는 Map, VOC/JPEGImages에 있는 파일들을 읽어 생성된 결과
    // IMAGE_SEGMENTATION, IMAGE_BBOX import할 때, 필요
    // (key : 확장자를 제외한 fileName, value : 이미지 파일 byte[])
    private Map<String, byte[]> importVocJpegImagesMap;
    // import할 bbox라벨 정보가 담겨있는 Map, VOC/Annotations에 있는 XML문서를 파싱해서 생성된 결과
    // IMAGE_BBOX import할 때, 필요
    // (key : 확장자를 제외한 fileName, value : JSONArray({name: 'book', box: "[x1],[y1],[width],[height]"}))
    private Map<String, JSONArray> importAnnotationsInfoMap;
    // import할 segmentation라벨 정보가 담겨있는 Map, VOC/SegmentationObject에 있는 이미지를 분석해서 생성된 결과
    // IMAGE_SEGMENTATION import할 때, 필요
    // (key : 확장자를 제외한 fileName, value : JSONArray([{info: {segmentation : [{}, ...], box: "[x1],[y1],[width],[height]"}, label: "[labelName]", area: "300.0"}])
    private Map<String, JSONArray> importSegmentationObjectInfoMap;


    public VocImportUtil(MultipartFile multipartFile) {
        this.vocZipFile = multipartFile;
        this.importAnnotationsInfoMap = new HashMap<>();
        //this.importVocImageSetsMainList = new ArrayList<>();
        this.importVocJpegImagesMap = new HashMap<>();
        // this.importVocImageSetsSegList = new ArrayList<>();
        this.importSegmentationObjectInfoMap = new HashMap<>();
    }

    public void initData(String labelType) {
        // 디렉토리 구조 검사
        isVocStructureExists();
        // zip 파일 압축 해제 후 해당하는 map에 저장
        readImportVocZipFile(labelType);
        // 계산 후 반환
        if ("IMAGE_SEGMENTATION".equals(labelType)) {
            addImportSegmentationObjectInfo();
        }
    }

    private void addImportSegmentationObjectInfo() {
//        if (this.importVocImageSetsSegList.size() <= 0) {
//            throw new HandlerCustomException("500", "Import할 SegmentationObject가 존재하지 않습니다.");
//        }
        if (this.importSegmentationObjectInfoMap.size() <= 0) {
            throw new HandlerCustomException("500", "Import할 SegmentationObject가 존재하지 않습니다.");
        }

        // area근사값으로 라벨명 찾기
        for (String fileName : importSegmentationObjectInfoMap.keySet()) {
            JSONArray annotationsResultArray = this.importAnnotationsInfoMap.get(fileName);
            JSONArray segmentationInfoArray = this.importSegmentationObjectInfoMap.get(fileName);
            segmentationInfoArray.forEach((jsonObject) -> {
                JSONObject segmentationInfoObj = (JSONObject) jsonObject;
                // 세그멘테이션 area값 꺼내오기
                double segArea = (double) segmentationInfoObj.get("area");
                double min = Double.MAX_VALUE;

                // XML에 있는 bbox값을 읽어 area를 구한 뒤, 세그멘테이션 area와 가장 근접한 값 찾기
                for (int i = 0; i < annotationsResultArray.size(); i++) {
                    JSONObject annotationsResultObject = (JSONObject) annotationsResultArray.get(i);
                    String labelName = (String) annotationsResultObject.get("label");
                    String[] boxInfo = ((String) annotationsResultObject.get("info")).split(",");
                    double width = Double.parseDouble(boxInfo[2]);
                    double height = Double.parseDouble(boxInfo[3]);
                    double area = width * height;
                    double abs = Math.abs(segArea - area);
                    if (abs < min) {
                        min = abs;
                        segmentationInfoObj.put("label", labelName);
                    }
                }
            });
        }
//        this.importSegmentationObjectInfoMap.for((fileName) -> {
//            JSONArray annotationsResultArray = this.importAnnotationsInfoMap.get(fileName);
//            JSONArray segmentationInfoArray = this.importSegmentationObjectInfoMap.get(fileName);
//            segmentationInfoArray.forEach((jsonObject) -> {
//                JSONObject segmentationInfoObj = (JSONObject) jsonObject;
//                // 세그멘테이션 area값 꺼내오기
//                double segArea = (double) segmentationInfoObj.get("area");
//                double min = Double.MAX_VALUE;
//
//                // XML에 있는 bbox값을 읽어 area를 구한 뒤, 세그멘테이션 area와 가장 근접한 값 찾기
//                for (int i = 0; i < annotationsResultArray.size(); i++) {
//                    JSONObject annotationsResultObject = (JSONObject) annotationsResultArray.get(i);
//                    String labelName = (String) annotationsResultObject.get("label");
//                    String[] boxInfo = ((String) annotationsResultObject.get("info")).split(",");
//                    double width = Double.parseDouble(boxInfo[2]);
//                    double height = Double.parseDouble(boxInfo[3]);
//                    double area = width * height;
//                    double abs = Math.abs(segArea - area);
//                    if (abs < min) {
//                        min = abs;
//                        segmentationInfoObj.put("label", labelName);
//                    }
//                }
//                //segmentationInfoObj.remove("area");
//            });
//        });
    }

    private void readImportVocZipFile(String labelType) {
        try (ZipInputStream zis = new ZipInputStream(this.vocZipFile.getInputStream())) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (entryValidate(entry, true)) continue;
                String entryName = entry.getName();
                // 디렉토리 소문자로 변환 후 문자열 비교하기 위한 변수
                String entryNameUpper = entryName.toUpperCase();
                if (entryNameUpper.contains(VocDirEnum.ANNOTATIONS.getDirPath())) {
                    addAnnotationsInfoMap(zis);
                } else if ("IMAGE_BBOX".equals(labelType) && entryNameUpper.contains(VocDirEnum.IMAGE_SETS_MAIN.getDirPath())) {
                    // addVocImageSetsMainList(zis);
                } else if ("IMAGE_SEGMENTATION".equals(labelType) && entryNameUpper.contains(VocDirEnum.IMAGE_SETS_SEGMENTATION.getDirPath())) {
                    // addVocImageSetsSegList(zis);
                } else if (entryNameUpper.contains(VocDirEnum.JPEG_IMAGES.getDirPath())) {
                    addJpegImagesMap(zis, entryName);
                } else if ("IMAGE_SEGMENTATION".equals(labelType) && entryNameUpper.contains(VocDirEnum.SEGMENTATION_OBJECT.getDirPath())) {
                    addImportSegmentationObjectInfoMap(zis, entryName);
                }
            }
        } catch (IOException e) {
            throw new HandlerCustomException("500", "Import하는 과정에서 에러가 발생했습니다.\nzip파일을 다시 확인해주세요.", e);
        } catch (HandlerCustomException e) {
            throw new HandlerCustomException(e.getCode(), e.getMessage(), e);
        }
    }

    private void addImportSegmentationObjectInfoMap(ZipInputStream zis, String entryName) {
        String fileName = entryName.substring(entryName.lastIndexOf("/") + 1, entryName.indexOf("."));
        File outputFile = null;
        // 윤곽선 찾아서 세그멘테이션으로 변환
        try {
            nu.pattern.OpenCV.loadShared();
            nu.pattern.OpenCV.loadLocally();
            System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

            // dataset_temp 디렉토리 및 저장할 파일 생성
            outputFile = new File(PathEnum.IMPORT_VOC_TEMP_PATH.getPath(), entryName);
            new File(outputFile.getParent()).mkdirs();
            FileOutputStream fos = new FileOutputStream(outputFile);
            int len = 0;
            byte[] buffer = new byte[4096];
            while ((len = zis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }

            // 저장된 이미지 매트릭스로 변환
            Mat originalImage = Imgcodecs.imread(PathEnum.IMPORT_VOC_TEMP_PATH.getPath() + "/" + entryName, Imgcodecs.IMREAD_COLOR);
            //Core.flip(originalImage, originalImage, 1);
            Map<String, Integer> colorMap = new HashMap<>();

            for (int i = 0; i < originalImage.rows(); i++) {
                for (int j = 0; j < originalImage.cols(); j++) {
                    double[] rgb = originalImage.get(i, j);
                    if (rgb[0] == 0.0 && rgb[1] == 0.0 && rgb[2] == 0.0 || rgb[0] == 255.0 && rgb[1] == 255.0 && rgb[2] == 255.0) {
                        continue;
                    }
                    String rgbStr = rgb[0] + "," + rgb[1] + "," + rgb[2];
                    colorMap.put(rgbStr, colorMap.size());
                }
            }

            AtomicInteger idx = new AtomicInteger();
            List<List<Point>> contoursPoints = new ArrayList<>();
            colorMap.keySet().forEach((key) -> {
                double[] scalarValue = Arrays.stream(key.split(","))
                        .mapToDouble(Double::parseDouble)
                        .toArray();

                Scalar lowerRed = new Scalar(scalarValue[0], scalarValue[1], scalarValue[2]);
                Scalar upperRed = new Scalar(scalarValue[0], scalarValue[1], scalarValue[2]);

                Mat mask = new Mat();
                Core.inRange(originalImage, lowerRed, upperRed, mask);

                List<MatOfPoint> contours = new ArrayList<>();
                Mat hierarchy = new Mat();
                Imgproc.findContours(mask, contours, hierarchy, Imgproc.RETR_EXTERNAL, Imgproc.CHAIN_APPROX_TC89_KCOS);

                // 테스트용
//                MatOfByte tempMatOfByte = new MatOfByte();
//                Imgcodecs.imencode(".png", mask, tempMatOfByte);
//                byte[] tempByteArray = tempMatOfByte.toArray();
//                FileOutputStream fos3 = null;
//                try {
//                    fos3 = new FileOutputStream("/Users/juno/Desktop/xml/" + "test" + idx + ".png");
//                    fos3.write(tempByteArray);
//                } catch (IOException e) {
//                    throw new RuntimeException(e);
//                }

                for (int i = 0; i < contours.size(); i++) {
                    MatOfPoint contour = contours.get(i);
                    List<Point> points = new ArrayList<>();
                    if (contour.toArray().length < 3) {
                        continue;
                    }
                    // mask 값을 포인트로 변환 후 넣기
                    for (Point point : contour.toArray()) {
                        points.add(point);
                    }
                    contoursPoints.add(points);
                }
                idx.getAndIncrement();
            });


            JSONArray resultJsonArray = new JSONArray();
            //JSONArray pointJsonArray = new JSONArray();
            JSONObject pointJsonObject = new JSONObject();

            for (List<Point> contoursPoint : contoursPoints) {
                JSONArray pointJsonArray = new JSONArray();
                JSONObject infoJsonObject = new JSONObject();
                JSONObject resultJsonObject = new JSONObject();
                int loopCnt = 0;
                double x1 = 0, y1 = 0, x2 = 0, y2 = 0;
                for (Point p : contoursPoint) {
                    // point 중복 로직 추가
                    long count = getDuplicatePointCount(pointJsonArray, p);
                    if (count > 0) {
                        continue;
                    }

                    x1 = (loopCnt == 0 || x1 > p.x) ? p.x : x1;
                    y1 = (loopCnt == 0 || y1 > p.y) ? p.y : y1;
                    x2 = (loopCnt == 0 || x2 < p.x) ? p.x : x2;
                    y2 = (loopCnt == 0 || y2 < p.y) ? p.y : y2;
                    pointJsonObject = new JSONObject();
                    pointJsonObject.put("x", p.x);
                    pointJsonObject.put("y", p.y);
                    pointJsonArray.add(pointJsonObject);
                    loopCnt++;
                }
                // x값 기준으로 오름차순 정렬
                // 1. JSON배열 객체 리스트로 변환
                //JSONArray sortPointJsonArray = getSortPointJsonArray(pointJsonArray);


                // 좌표값으로 width, height 구해서 문자열로 반환
                // 반환 값 : "[x1],[y1],[width],[height]"
                String box = calcBoxSizeToString(x1, y1, x2, y2);
                // 넓이 계산
                double width = x2 - x1;
                double height = y2 - y1;
                // 세그멘테이션에 해당하는 라벨명을 찾기 위한 area값
                double area = width * height;
                infoJsonObject.put("segmentation", pointJsonArray);
                infoJsonObject.put("box", box);
                resultJsonObject.put("info", infoJsonObject);
                resultJsonObject.put("area", area);
                resultJsonArray.add(resultJsonObject);
            }

            this.importSegmentationObjectInfoMap.put(fileName, resultJsonArray);
        } catch (Exception e) {
            throw new HandlerCustomException("500", "SegmentationObject 파일을 생성하는 과정에서 알 수 없는 오류가 발생하였습니다.", e);
        } finally {
            // 임시로 저장된 SegmentationObject파일 삭제
            if (outputFile != null) {
                outputFile.delete();
            }
        }
    }

    private JSONArray getSortPointJsonArray(JSONArray pointJsonArray) {
        List<JSONObject> jsonList = new ArrayList<>();
//        double minX = 0;
//        double minY = 0;
        double maxY = 0;
        double firstY = 0;
        double firstX = 0;
        // 1. JSONArray -> List로 변환
        for (int i = 0; i < pointJsonArray.size(); i++) {
            JSONObject jsonObject = (JSONObject) pointJsonArray.get(i);
            double x = (double) jsonObject.get("x");
            double y = (double) jsonObject.get("y");
            firstX = (i == 0 || x < firstX) ? x : firstX;
            firstY = (firstX == x && firstY < y) ? y : firstY;
            maxY = (i == 0 || maxY < y) ? y : maxY;

//            minX = (i == 0 || x <= minX) ? x : minX;
//            minY = (i == 0 || minY > y)? y : minY;
//            firstY = (minX == x && firstY < y)? y : firstY;
//            if(minX == x && firstY < y) {
//                firstY = (double)jsonObject.get("y");
//            }
            //minY = (i == 0 || y< minY) ? y : minY;
            jsonList.add(jsonObject);
        }

        // 2. List x값 오름차순 정렬
        //double finalMinX = minX;
        //double finalMinY = minY;
//        double finalMinX = minX;
//        double finalMaxY = maxY;
//        double finalFirstY = firstY;
        double finalFirstX = firstX;
        double finalFirstY = firstY;
        double finalMaxY = maxY;
        Collections.sort(jsonList, new Comparator<JSONObject>() {
            @Override
            public int compare(JSONObject o1, JSONObject o2) {
                double compareX1 = (double) o1.get("x");
                double compareX2 = (double) o2.get("x");
                return Double.compare(compareX1, compareX2);
            }
        });

        Collections.sort(jsonList, new Comparator<JSONObject>() {
            int idx = 0;
            double tempY = 0;

            @Override
            public int compare(JSONObject o1, JSONObject o2) {
                double compareY1 = (double) o1.get("y");
                double compareY2 = (double) o2.get("y");
                if (idx == 0) {
                    tempY = compareY1;
                    idx++;
                    return 0;
                }

                // 좀더 가까운게 distance값이 작음
                double distanceY1 = tempY - compareY1;
                double distanceY2 = tempY - compareY2;

                if (distanceY1 < distanceY2) {
                    tempY = compareY1;
                    return 0;
                } else {
                    tempY = compareY2;
                    return -1;
                }

                // Y값이 비슷한 것 중에, Y가 더 큰 것
                //return Double.compare(compareY1, compareY2);
            }
        });

        // 3. List -> JSONArray 변환
        JSONArray sortPointJsonArray = new JSONArray();
        for (int i = 0; i < jsonList.size(); i++) {
            JSONObject jsonObject = jsonList.get(i);
            sortPointJsonArray.add(jsonObject);
        }
        return sortPointJsonArray;
    }

    private long getDuplicatePointCount(JSONArray pointJsonArray, Point p) {
        // point 중복제거 로직 추가
        return pointJsonArray.stream().filter((pointJson) -> {
            JSONObject jsonObject = (JSONObject) pointJson;
            return (double) jsonObject.get("x") == p.x && (double) jsonObject.get("y") == p.y;
        }).count();
    }

    private String calcBoxSizeToString(double x1, double y1, double x2, double y2) {
        double width = x2 - x1;
        double height = y2 - y1;
        return String.valueOf(x1) + "," + String.valueOf(y1) + "," + String.valueOf(width) + "," + String.valueOf(height);
    }

    private void addJpegImagesMap(ZipInputStream zis, String entryName) throws IOException {
        String fileName = entryName.substring(entryName.lastIndexOf("/") + 1, entryName.indexOf("."));
        // 파일 읽어서 byte[]로 저장
        this.importVocJpegImagesMap.put(fileName, IOUtils.toByteArray(zis));
    }

    private void addVocImageSetsSegList(ZipInputStream zis) throws IOException {
        String imageSetsSegStr = new String(IOUtils.toByteArray(zis));
        String[] splitImageSetsMainStr = imageSetsSegStr.split("\n");
        // this.importVocImageSetsSegList.addAll(Arrays.asList(splitImageSetsMainStr));
    }

    private void addVocImageSetsMainList(ZipInputStream zis) throws IOException {
        String imageSetsMainStr = new String(IOUtils.toByteArray(zis));
        String[] splitImageSetsMainStr = imageSetsMainStr.split("\n");
        //this.importVocImageSetsMainList.addAll(Arrays.asList(splitImageSetsMainStr));
    }

    private void addAnnotationsInfoMap(ZipInputStream zis) throws IOException {
        try {
            InputStream inputStream = IOUtils.toBufferedInputStream(zis);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(inputStream);
            doc.getDocumentElement().normalize();
            // xml 문서에서 파일명 추출
            String fileName = doc.getElementsByTagName("filename").item(0).getTextContent();
            fileName = fileName.substring(0, fileName.indexOf("."));
            // Object 노드 모두 추출
            NodeList objectNodeList = doc.getElementsByTagName("object");
            for (int i = 0; i < objectNodeList.getLength(); i++) {
                Element element = (Element) objectNodeList.item(i);
                // xml 문서에서 xmin, ymin, xmax, ymax 추출
                double x1 = Double.parseDouble(element.getElementsByTagName("xmin").item(0).getTextContent());
                double y1 = Double.parseDouble(element.getElementsByTagName("ymin").item(0).getTextContent());
                double x2 = Double.parseDouble(element.getElementsByTagName("xmax").item(0).getTextContent());
                double y2 = Double.parseDouble(element.getElementsByTagName("ymax").item(0).getTextContent());
                double width = x2 - x1;
                double height = y2 - y1;
                String labelName = element.getElementsByTagName("name").item(0).getTextContent();
                String box = String.valueOf(x1) + "," + String.valueOf(y1) + "," + String.valueOf(width) + "," + String.valueOf(height);

                JSONObject annotationObj = new JSONObject();
                annotationObj.put("label", labelName);
                annotationObj.put("info", box);

                if (this.importAnnotationsInfoMap.containsKey(fileName)) {
                    this.importAnnotationsInfoMap.get(fileName).add(annotationObj);
                } else {
                    this.importAnnotationsInfoMap.put(fileName, new JSONArray());
                    this.importAnnotationsInfoMap.get(fileName).add(annotationObj);
                }
            }
        } catch (SAXException | ParserConfigurationException e) {
            throw new HandlerCustomException("500", "XML파일을 파싱하는 과정에서 에러가 발생했습니다.", e);
        }
    }

    // VOC 디렉토리 구조인지 검사, VOC, VOC/Annotations, VOC/ImageSets, VOC/ImageSets/main/, VOC/ImageSets/Segmentation, VOC/JPEGImages, VOC/SegmentationObject 폴더 중 하나라도 없으면 false
    private void isVocStructureExists() {
        boolean isAnnotations = false;
        boolean isImageSets = false;
        boolean isMain = false;
        boolean isSegmentation = false;
        boolean isJpegImage = false;
        boolean isSegmentationObject = false;
        try (ZipInputStream zis = new ZipInputStream(this.vocZipFile.getInputStream())) {
            ZipEntry entry = zis.getNextEntry();
            if (!entry.getName().equals("VOC/")) {
                throw new HandlerCustomException("500", "IMPORT 가능한 VOC 디렉토리 구조가 아닙니다.\nzip파일을 다시 확인해주세요.");
            }

            while ((entry = zis.getNextEntry()) != null) {
                if (entryValidate(entry, false)) continue;
                if (entry.isDirectory()) {
                    switch (entry.getName().toUpperCase()) {
                        case "VOC/ANNOTATIONS/":
                            isAnnotations = true;
                            break;
                        case "VOC/IMAGESETS/":
                            isImageSets = true;
                            break;
                        case "VOC/IMAGESETS/MAIN/":
                            isMain = true;
                            break;
                        case "VOC/IMAGESETS/SEGMENTATION/":
                            isSegmentation = true;
                            break;
                        case "VOC/JPEGIMAGES/":
                            isJpegImage = true;
                            break;
                        case "VOC/SEGMENTATIONOBJECT/":
                            isSegmentationObject = true;
                            break;
                    }
                } else {
                    break;
                }
            }

            if (!isAnnotations || !isImageSets || !isMain || !isSegmentation || !isJpegImage || !isSegmentationObject) {
                throw new HandlerCustomException("500", "IMPORT 가능한 VOC 디렉토리 구조가 아닙니다.\nzip파일을 다시 확인해주세요.");
            }
        } catch (IOException e) {
            throw new HandlerCustomException("500", "IMPORT 가능한 VOC 디렉토리 구조가 아닙니다.\nzip파일을 다시 확인해주세요.", e);
        }
    }

    // zip파일 내부에 불필요한 파일 포함되어있는지 검사
    private boolean entryValidate(ZipEntry entry, boolean dirSkipStatus) {
        if (entry.getName().contains("_MACOSX")) {
            return true;
        }
        if (entry.getName().contains(".DS_Store")) {
            return true;
        }
        return dirSkipStatus && entry.isDirectory();
    }


    public Map<String, byte[]> getImportVocJpegImagesMap() {
        return importVocJpegImagesMap;
    }

    public Map<String, JSONArray> getImportAnnotationsInfoMap() {
        return importAnnotationsInfoMap;
    }

    public Map<String, JSONArray> getImportSegmentationObjectInfoMap() {
        return importSegmentationObjectInfoMap;
    }
}
