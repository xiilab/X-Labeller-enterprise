package com.xlabeller.common.module;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.enums.PathEnum;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.opencv.core.*;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class VirtualImportUtil {
    private InputStream zipInputStream;
    private Map<String, byte[]> importVirtualJpegImagesMap;
    private Map<String, JSONArray> importBoxObjectsInfoMap;
    private Map<String, JSONArray> importSegObjectInfoMap;

    public VirtualImportUtil(InputStream zipInputStream) {
        this.zipInputStream = zipInputStream;
        this.importVirtualJpegImagesMap = new HashMap<>();
        this.importBoxObjectsInfoMap = new HashMap<>();
        this.importSegObjectInfoMap = new HashMap<>();
    }

    public void initData(String labelType) {
        readImportVirtualZipFile(labelType);
        if ("IMAGE_SEGMENTATION".equals(labelType)) {
            addImportSegmentationObjectInfo();
        }
    }

    public void readImportVirtualZipFile(String labelType) {
        // 1. 압축 해제
        try (ZipInputStream zis = new ZipInputStream(this.zipInputStream)) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (entryValidate(entry)) continue;
                String entryName = entry.getName();
                String extension = entryName.substring(entryName.lastIndexOf(".") + 1);

                // 파일명에 "_seg"가 포함되어 있지 않거나, 확장자가 png이면 importVirtualJpegImagesMap에 put
                if (labelType.equals("IMAGE_SEGMENTATION") && entryName.contains("_seg") && "png".equals(extension)) {
                    addImportSegmentationObjectInfo(zis, entryName);
                } else if (extension.equals("json")) {
                    addImportObjectInfo(zis, entryName);
                    // tempImportBoxObjectsInfoMap.put(entryName, jsonArray);
                } else if (!entryName.contains("_seg") && "png".equals(extension)) {
                    byte[] bytes = IOUtils.toByteArray(zis);
                    importVirtualJpegImagesMap.put(entryName, bytes);
                }
            }
        } catch (Exception e) {
            if (e instanceof IOException) {
                throw new HandlerCustomException("500", "SegmentationObject 파일을 생성하는 과정에서 알 수 없는 오류가 발생하였습니다.", e);
            } else if (e instanceof ParseException) {
                throw new HandlerCustomException("500", "SegmentationObject 파일을 생성하는 과정에서 알 수 없는 오류가 발생하였습니다.", e);
            }
        }
    }

    private void addImportObjectInfo(ZipInputStream zis, String entryName) throws IOException, ParseException {
        String jsonContent = IOUtils.toString(zis, StandardCharsets.UTF_8);
//        String processedString = jsonContent.replaceAll("\\[\n\r\t\\|\\uFEFF\\&nbsp]", "");
//        String processedString = jsonContent.replaceAll("*\\.", "");
        String processedString = jsonContent.replaceAll("[\r\n\t|\\uFEFF]+", "");
        JSONParser jsonParser = new JSONParser();
        JSONArray jsonArray = (JSONArray) jsonParser.parse(processedString);
        // JSONArray jsonArray1 = new JSONArray();

        for (Object jsonObject : jsonArray) {
            JSONObject tempJsonObject = (JSONObject) jsonObject;
            // x1, y1, x2, y2 값 추출
            double x1 = Math.floor(Double.parseDouble(tempJsonObject.get("x1").toString()) * 10) / 10;
            double y1 = Math.floor(Double.parseDouble(tempJsonObject.get("y1").toString()) * 10) / 10;
            double x2 = Math.floor(Double.parseDouble(tempJsonObject.get("x2").toString()) * 10) / 10;
            double y2 = Math.floor(Double.parseDouble(tempJsonObject.get("y2").toString()) * 10) / 10;
            double width = x2 - x1;
            double height = y2 - y1;
            // 라벨명 추출
            String labelName = (String)tempJsonObject.get("type");
            String box = String.valueOf(x1) + "," + String.valueOf(y1) + "," + String.valueOf(width) + "," + String.valueOf(height);
            double area = width * height;

            JSONObject annotationObj = new JSONObject();
            annotationObj.put("info", box);
            annotationObj.put("label", labelName);
            annotationObj.put("area", area);

            if (this.importBoxObjectsInfoMap.containsKey(entryName)) {
                this.importBoxObjectsInfoMap.get(entryName).add(annotationObj);
            } else {
                this.importBoxObjectsInfoMap.put(entryName, new JSONArray());
                this.importBoxObjectsInfoMap.get(entryName).add(annotationObj);
            }
        }
    }

    private void addImportSegmentationObjectInfo(ZipInputStream zis, String entryName) {
        // 서버에 저장
        File outputFile = null;
        try {
            nu.pattern.OpenCV.loadShared();
            nu.pattern.OpenCV.loadLocally();
            System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

            // dataset_temp 디렉토리 생성하고, 이미지 저장
            outputFile = new File(PathEnum.IMPORT_VOC_TEMP_PATH.getPath(), entryName);
            // dataset_temp 디렉토리 생성
            new File(outputFile.getParent()).mkdirs();
            FileOutputStream fos = new FileOutputStream(outputFile);
            int len = 0;
            byte[] buffer = new byte[4096];
            while ((len = zis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }

            // 저장된 이미지 매트릭스로 변환
//            Mat originalImage = Imgcodecs.imread(PathEnum.IMPORT_VOC_TEMP_PATH.getPath() + "/" + entryName, Imgcodecs.IMREAD_GRAYSCALE);
            Mat originalImage = Imgcodecs.imread(PathEnum.IMPORT_VOC_TEMP_PATH.getPath() + "/" + entryName, CvType.CV_8U);
            // 이미지의 RGB를 키로 저장할 MAP
            // ex) key: 100,100,100, value: [아무 값]
            Map<String, Integer> colorMap = new HashMap<>();

            // matrix로 변환한 이미지의 한 행과 열을 읽어 색상값 추출
//            for (int i = 0; i < originalImage.rows(); i++) {
//                for (int j = 0; j < originalImage.cols(); j++) {
//                    double[] rgb = originalImage.get(i, j);
//                    if (rgb[0] == 0.0 && rgb[1] == 0.0 && rgb[2] == 0.0 || rgb[0] == 255.0 && rgb[1] == 255.0 && rgb[2] == 255.0) {
//                        continue;
//                    }
//
//                    // 추출한 색상값을 문자열로 변환
//                    String rgbStr = rgb[0] + "," + rgb[1] + "," + rgb[2];
//                    // 변환한 문자열 키로 저장
//                    colorMap.put(rgbStr, colorMap.size());
//                }
//            }

            List<List<Point>> contoursPoints = new ArrayList<>();

            // 저장된 키 반복문 돌려 "," 문자열 기준으로 자른뒤, 각 원소를 Double로 변환
            colorMap.keySet().forEach((key) -> {
                double[] scalarValue = Arrays.stream(key.split(","))
                        .mapToDouble(Double::parseDouble)
                        .toArray();

                // 최저, 최대 색상값 변수로 저장
                Scalar lowerRed = new Scalar(scalarValue[0], scalarValue[1], scalarValue[2]);
                Scalar upperRed = new Scalar(scalarValue[0], scalarValue[1], scalarValue[2]);

                Mat mask = new Mat();

                // 색상값 범위 지정해서 외곽선 검출
                // Core.inRange(originalImage, lowerRed, upperRed, mask);

//                List<MatOfPoint> contours = new ArrayList<>();
//                Mat hierarchy = new Mat();
//                Imgproc.findContours(originalImage, contours, hierarchy, Imgproc.RETR_EXTERNAL, Imgproc.CHAIN_APPROX_TC89_KCOS);
//
//                for (int i = 0; i < contours.size(); i++) {
//                    MatOfPoint contour = contours.get(i);
//                    List<Point> points = new ArrayList<>();
//                    if (contour.toArray().length < 3) {
//                        continue;
//                    }
//                    // mask 값을 포인트로 변환 후 넣기
//                    for (Point point : contour.toArray()) {
//                        points.add(point);
//                    }
//
//                    contoursPoints.add(points);
//                }
            });

            List<MatOfPoint> contours = new ArrayList<>();
            Mat hierarchy = new Mat();
            Imgproc.findContours(originalImage, contours, hierarchy, Imgproc.RETR_EXTERNAL, Imgproc.CHAIN_APPROX_TC89_KCOS);

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

            JSONArray resultJsonArray = new JSONArray();
            JSONObject pointJsonObject = new JSONObject();

            for (List<Point> contoursPoint : contoursPoints) {
                JSONArray pointJsonArray = new JSONArray();
                JSONObject infoJsonObject = new JSONObject();
                JSONObject resultJsonObject = new JSONObject();
                int loopCnt = 0;
                double x1 = 0, y1 = 0, x2 = 0, y2 = 0;
                for (Point p : contoursPoint) {
                    // point 중복 제거
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
                infoJsonObject.put("area", area);
                resultJsonObject.put("info", infoJsonObject);
                resultJsonArray.add(resultJsonObject);
            }
            importSegObjectInfoMap.put(entryName, resultJsonArray);

        } catch (Exception e) {
        } finally {
            // 임시로 저장된 SegmentationObject파일 삭제
            if (outputFile != null) {
                outputFile.delete();
            }
        }
    }

    private boolean entryValidate(ZipEntry entry) {
        if (entry.getName().contains("_MACOSX")) {
            return true;
        }
        if (entry.getName().contains(".DS_Store")) {
            return true;
        }

        return entry.isDirectory();
    }

    private void addImportSegmentationObjectInfo() {
//        if (this.importVocImageSetsSegList.size() <= 0) {
//            throw new HandlerCustomException("500", "Import할 SegmentationObject가 존재하지 않습니다.");
//        }
        if (this.importSegObjectInfoMap.size() <= 0) {
            throw new HandlerCustomException("500", "Import할 SegmentationObject가 존재하지 않습니다.");
        }

        // area근사값으로 라벨명 찾기
        for (String fileName : importSegObjectInfoMap.keySet()) {
            JSONArray annotationsResultArray = this.importBoxObjectsInfoMap.get(fileName.split("_")[0] + ".json");
            JSONArray segmentationInfoArray = this.importSegObjectInfoMap.get(fileName);
            segmentationInfoArray.forEach((jsonObject) -> {
                JSONObject segmentationInfoObj = (JSONObject) jsonObject;
                // 세그멘테이션 area값 꺼내오기
                JSONObject infoObject = (JSONObject) segmentationInfoObj.get("info");
                double segArea = (double)infoObject.get("area");
                double min = Double.MAX_VALUE;

                // XML에 있는 bbox값을 읽어 area를 구한 뒤, 세그멘테이션 area와 가장 근접한 값 찾기
                for (int i = 0; i < annotationsResultArray.size(); i++) {
                    JSONObject annotationsResultObject = (JSONObject) annotationsResultArray.get(i);
                    String labelName = (String) annotationsResultObject.get("label");
                    double area = (double) annotationsResultObject.get("area");
                    double abs = Math.abs(segArea - area);
                    if (abs < min) {
                        min = abs;
                        segmentationInfoObj.put("label", labelName);
                    }
                }
            });
        }
    }

    private long getDuplicatePointCount(JSONArray pointJsonArray, Point p) {
        // point 중복제거 추가
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
    public Map<String, byte[]> getImportVirtualJpegImagesMap() {
        return importVirtualJpegImagesMap;
    }

    public Map<String, JSONArray> getImportBoxObjectsInfoMap() {
        return importBoxObjectsInfoMap;
    }

    public Map<String, JSONArray> getImportSegObjectInfoMap() {
        return importSegObjectInfoMap;
    }

}
