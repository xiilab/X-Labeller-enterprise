package com.xlabeller.visualization;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.common.module.Output;
import com.xlabeller.data.DataDao;
import com.xlabeller.enums.VisualLabelResultTypeEnum;
import com.xlabeller.meta.MetaDao;
import com.xlabeller.models.*;
import lombok.RequiredArgsConstructor;
import org.apache.poi.util.StringUtil;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class VisualizationService {
    private final VisualizationDao visualizationDao;
    private final DataDao dataDao;
    private final MetaDao metaDao;

    /**
     * 해상도별 데이터 수량
     */
    public Object getDataQuantityPerResolution(VisualizationVO visualizationVO) {
        if (visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        Object result = visualizationDao.getDataQuantityPerResolution(visualizationVO);
        return Output.JsonOutput("200", result);
    }

    /**
     * 클래스별 데이터 수량
     */
    public Object getDataQuantityPerClass(VisualizationVO visualizationVO) {
        if (visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        Object result = visualizationDao.getDataQuantityPerClass(visualizationVO);
        return Output.JsonOutput("200", result);
    }

    /**
     * 해상도별 객체 수량
     */
    public Object getClassQuantityPerResolution(VisualizationVO visualizationVO) {
        if (visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        Object result = visualizationDao.getClassQuantityPerResolution(visualizationVO);
        return Output.JsonOutput("200", result);
    }

    /**
     * 오브젝트 크기별 분포
     */
    public Object getDistributionByObjectSize(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
    	if (!StringUtils.hasText(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        
        
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) [{width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...]
        List<JSONObject> resultList = new ArrayList<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.SIZE.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);

                    resultList.add(resultObj);
                }
        );

        // JSON List 2차원 배열로 변환
        double[][] resultArray = listTo2dDoubleArray(VisualLabelResultTypeEnum.SIZE.getResultType(), resultList);
        return Output.JsonOutput("200", resultArray);
    }

    /**
     * Object width별 분포
     * ㅌㅍ
     */
    public Object getLabelCountByWidth(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
        if (datasetId == null || "".equals(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) {width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...
        Map<Double, Integer> resultMap = new HashMap<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 imageWhMap value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    // dataId가 일치하는 이미지 width, height를 10으로 나눈 값 변수로 저장
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.SIZE.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);
                    double labelWidthSizeScore = (double) resultObj.get("widthScore");

                    // 중복되는 키가 있으면, value가져와서 +1
                    //int labelCount = resultMap.containsKey(labelWidthSizeScore) ? resultMap.get(labelWidthSizeScore) + 1 : 1;
                    int labelCount = resultMap.getOrDefault(labelWidthSizeScore, 0) + 1;

                    resultMap.put(labelWidthSizeScore, labelCount);
                }
        );

        // key를 오름차순으로 정렬
        Map<Double, Integer> sortedMap = new TreeMap<>(resultMap);
        return Output.JsonOutput("200", sortedMap);
    }

    /**
     * Object height별 분포
     */
    public Object getLabelCountByHeight(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
    	if (datasetId == null || "".equals(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) {width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...
        Map<Double, Integer> resultMap = new HashMap<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.SIZE.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);
                    double labelHeightScore = (double) resultObj.get("heightScore");
                    // 중복되는 키가 있으면, value가져와서 +1
                    // int labelCount = resultMap.containsKey(labelHeightScore) ? resultMap.get(labelHeightScore) + 1 : 1;
                    int labelCount = resultMap.getOrDefault(labelHeightScore, 0) + 1;
                    resultMap.put(labelHeightScore, labelCount);
                }
        );

        // key를 오름차순으로 정렬
        Map<Double, Integer> sortedMap = new TreeMap<>(resultMap);
        return Output.JsonOutput("200", sortedMap);
    }

    /**
     * 경계범위 중심분포
     */
    public Object getBoundaryRangeCentroidDistribution(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
        if (datasetId == null || "".equals(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) [{width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...]
        List<JSONObject> resultList = new ArrayList<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.CENTER_POSITION.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);

                    resultList.add(resultObj);
                }
        );

        // JSON List 2차원 배열로 변환
        double[][] resultArray = listTo2dDoubleArray(VisualLabelResultTypeEnum.CENTER_POSITION.getResultType(), resultList);
        return Output.JsonOutput("200", resultArray);
    }

    /**
     * center x별 분포
     */
    public Object getLabelCountByCenterX(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
        if (datasetId == null || "".equals(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) {width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...
        Map<Double, Integer> resultMap = new HashMap<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.CENTER_POSITION.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);
                    double labelCenterXScore = (double) resultObj.get("centerXScore");
                    // 중복되는 키가 있으면, value가져와서 +1
                    //int labelCount = resultMap.containsKey(labelCenterXScore) ? resultMap.get(labelCenterXScore) + 1 : 1;
                    int labelCount = resultMap.getOrDefault(labelCenterXScore, 0) + 1;
                    resultMap.put(labelCenterXScore, labelCount);
                }
        );

        // key를 오름차순으로 정렬
        Map<Double, Integer> sortedMap = new TreeMap<>(resultMap);
        return Output.JsonOutput("200", sortedMap);
    }

    /**
     * center x별 분포
     */
    public Object getLabelCountByCenterY(VisualizationVO visualizationVO) {
    	String datasetId = visualizationVO.getDataset_id();
    	String label = visualizationVO.getLabel();
        if (datasetId == null || "".equals(datasetId)) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        // 반환할 객체, JSON객체가 담긴 list로 반환 ex) {width : 0.1, height : 0.1}, {width : 0.5, height : 0.3}, ...
        Map<Double, Integer> resultMap = new HashMap<>();

        // 1. 모든 이미지 목록을 가져와 width, height를 10으로 나눈 값으로 map반환
        Map<String, JSONObject> imageWhMap = getDividedTenImageWhMap(datasetId);

        // 2. imageWhMap Key에 해당하는 모든 라벨 목록을 가져옴
        List<MetaVO> metaListInDataId = getMetaListInDataId(imageWhMap, label);

        // 3. 가져온 라벨 목록의 imageID와 동일한 imageWhMap Key가 있으면 value를 가져와 라벨의 width, height를 value의 width, height로 나눠 계산된 값으로 MAP로 생성
        // MAP = KEY : "IMAGE_ID", VALUE : 계산된 값 배열
        metaListInDataId.forEach(metaVO -> {
                    String dataId = metaVO.getData_id();
                    String labelType = metaVO.getLabel_type();
                    String info = metaVO.getInfo();
                    JSONObject imageWhValue = imageWhMap.get(dataId);
                    double imageWhMapWidth = (double) imageWhValue.get("width");
                    double imageWhMapHeight = (double) imageWhValue.get("height");

                    JSONObject resultObj = getResultObjByLabelTypeAndResultType(VisualLabelResultTypeEnum.CENTER_POSITION.getResultType(), labelType, info, imageWhMapWidth, imageWhMapHeight);
                    double labelCenterYScore = (double) resultObj.get("centerYScore");
                    // 중복되는 키가 있으면, value가져와서 +1
                    // int labelCount = resultMap.containsKey(labelCenterYScore) ? resultMap.get(labelCenterYScore) + 1 : 1;
                    int labelCount = resultMap.getOrDefault(labelCenterYScore, 0) + 1;
                    resultMap.put(labelCenterYScore, labelCount);
                }
        );

        // key를 오름차순으로 정렬
        Map<Double, Integer> sortedMap = new TreeMap<>(resultMap);
        return Output.JsonOutput("200", sortedMap);
    }

    // 인자로 전달받은 map의 모든 Key를 여러개의 DATA_ID 문자열로 변환 후 라벨 목록을 가져옴
    // DATA_ID 문자열 변환 형식 ex) 1,2,3,4,5,...
    private List<MetaVO> getMetaListInDataId(Map<String, JSONObject> imageWhMap, String label) {
        // imageWhMap의 key인 data_id를 다음과 같은 형태로 반환함 => ex) 1,2,3,4,5
        String dataIdList = imageWhMap.keySet().stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
        MetaVO selectMetaVO = new MetaVO();
        selectMetaVO.setData_ids(dataIdList);
        selectMetaVO.setLabel(label);
        List<MetaVO> metaListInDataId = metaDao.getMetaByDataId(selectMetaVO);
        return metaListInDataId;
    }

    // image의 width, height를 10으로 나눈 값을 MAP형태로 반환
    // ex) MAP = (Key : DATA_ID, VALUE : JSONObject(width : 61.2, height : 22.7))
    private Map<String, JSONObject> getDividedTenImageWhMap(String datasetId) {
        // 1. 모든 이미지 목록을 가져옴
        DataVO selectDataVO = new DataVO();
        selectDataVO.setDataset_id(datasetId);
        List<DataVO> dataList = dataDao.getDataList(selectDataVO);

        // 2. Key가 "IMAGE_ID"이고, Value는 모든 이미지의 width, height를 각각 10으로 나눈 값을 JSON형식으로 저장
        // ex) 1920 X 1080 기준 => MAP("30" : {width : 192, height : 108})
        // DecimalFormat df = new DecimalFormat("#####.00");
        Map<String, JSONObject> imageWhMap = new HashMap<>();
        for (DataVO dataVO : dataList) {
//            double imageWidthDividedByTen = 0;
//            double imageHeightDividedByTen = 0;
            double imageWidthDividedByTen = Double.parseDouble(dataVO.getWidth()) / 10;
            double imageHeightDividedByTen = Double.parseDouble(dataVO.getHeight()) / 10;

            JSONObject imageDividedWHJson = new JSONObject();
            imageDividedWHJson.put("width", imageWidthDividedByTen);
            imageDividedWHJson.put("height", imageHeightDividedByTen);

            imageWhMap.put(dataVO.getData_id(), imageDividedWHJson);
        }

        return imageWhMap;
    }

    // (중심값 or 사이즈 크기) 또는 labelType에 따라 info의 값이 달라 원하는 값을 얻기 위해 분기처리
    private JSONObject getResultObjByLabelTypeAndResultType(String resultType, String labelType, String info, double imageWhMapWidth, double imageWhMapHeight) {
        JSONObject resultObj = new JSONObject();
        JSONParser segmentationInfoParser = new JSONParser();

        // 라벨타입에 따라 width, height를 가져오는 방식이 다름
        if (labelType.equals("IMAGE_BBOX")) {
            if(resultType.equals(VisualLabelResultTypeEnum.SIZE.getResultType())) {
                resultObj = getLabelWhSizeScore(info, imageWhMapWidth, imageWhMapHeight);
            } else {
                resultObj = getLabelCenterPositionScore(info, imageWhMapWidth, imageWhMapHeight);
            }
        } else if (labelType.equals("IMAGE_SEGMENTATION")) {
            // JSONArray segInfoJsonArray = null;
            try {
                JSONArray segInfoJsonArray = (JSONArray) segmentationInfoParser.parse(info);
                String box = (String) ((JSONObject) segInfoJsonArray.get(0)).get("box");

                if(resultType.equals(VisualLabelResultTypeEnum.SIZE.getResultType())) {
                    resultObj = getLabelWhSizeScore(box, imageWhMapWidth, imageWhMapHeight);
                } else {
                    resultObj = getLabelCenterPositionScore(box, imageWhMapWidth, imageWhMapHeight);
                }
            } catch (org.json.simple.parser.ParseException e) {
                throw new HandlerCustomException("500", "JSON을 파싱하던 중 에러가 발생했습니다.", e);
            }

            // String box = (String) ((JSONObject) segInfoJsonArray.get(0)).get("box");

//            if(resultType.equals(VisualLabelResultTypeEnum.SIZE.getResultType())) {
//                resultObj = getLabelWhSizeScore(box, imageWhMapWidth, imageWhMapHeight);
//            } else {
//                resultObj = getLabelCenterPositionScore(box, imageWhMapWidth, imageWhMapHeight);
//            }
        }

        return resultObj;
    }

    // Label의 width, height를 각각 image width, height를 10으로 나눈 값으로 나눠서 계산된 값을 반환
    private JSONObject getLabelWhSizeScore(String info, double imageWhMapWidth, double imageWhMapHeight) {
        // x1, y1, width, height로 넘어오는 값을 ','기준으로 자름
        double[] objectSize = Arrays.stream(info.split(","))
                .mapToDouble(str -> Double.parseDouble(str))
                .toArray();

        // score = (label width or height) / 원본 이미지의 (width or height)를 10으로 나눈 값
        double objectWidthScore =  objectSize[2] / imageWhMapWidth;
        double objectHeightScore = objectSize[3] / imageWhMapHeight;

        JSONObject scoreJson = new JSONObject();
        // 소수점 둘째자리까지 표현 후 json에 넣음
        scoreJson.put("widthScore", Math.floor(objectWidthScore * 10) / 100);
        scoreJson.put("heightScore", Math.floor(objectHeightScore * 10) / 100);

        return scoreJson;
    }

    // Label의 centerX, centerY를 각각 image width, height를 10으로 나눈 값으로 나눠서 계산된 값을 반환
    private JSONObject getLabelCenterPositionScore(String info, double imageWhMapWidth, double imageWhMapHeight) {
        // x1, y1, width, height로 넘어오는 값을 ','기준으로 자름
        double[] objectSize = Arrays.stream(info.split(","))
                .mapToDouble(Double::parseDouble)
                .toArray();

        // score = (label width or height) / 원본 이미지의 (width or height)를 10으로 나눈 값
        double objectX1 = objectSize[0];
        double objectY1 = objectSize[1];
        // 계산식 : (((x1 * 2) + width) / 2) / (image의 width를 10으로 나눈 값)
        double objectXCenterScore = (((objectX1 * 2) + objectSize[2]) / 2) / imageWhMapWidth;
        // 계산식 : (((y1 * 2) + height) / 2) / (image의 height를 10으로 나눈 값)
        double objectYCenterScore = (((objectY1 * 2) + objectSize[3]) / 2) / imageWhMapHeight;

        JSONObject scoreJson = new JSONObject();
        // 소수점 둘째자리까지 표현 후 json에 넣음
        scoreJson.put("centerXScore", Math.floor(objectXCenterScore * 10) / 100);
        scoreJson.put("centerYScore", Math.floor(objectYCenterScore * 10) / 100);

        return scoreJson;
    }

    // JSON List 2차원 배열로 변환
    private double[][] listTo2dDoubleArray(String resultType, List<JSONObject> resultList) {
        double[][] resultArray = new double[resultList.size()][resultList.get(0).size()];

        for (int i = 0; i < resultList.size(); i++) {
            JSONObject resultObj = resultList.get(i);
            // resultArray[i] = new double[resultObj.size()];
            for (int j = 0; j < resultObj.size(); j++) {
                String key = (resultType.equals(VisualLabelResultTypeEnum.SIZE.getResultType())) ?
                        ((j % 2 == 0) ? "widthScore" : "heightScore") :
                        ((j % 2 == 0) ? "centerXScore" : "centerYScore");
                resultArray[i][j] = (double) resultObj.get(key);
            }
        }

        return resultArray;
    }
    
    /**
     * 데이터셋별 라벨 목록 
     * @param visualizationVO dataset_id
     * @return
     */
	public Object getLabelList(VisualizationVO visualizationVO) {
		if (visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
            return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        Object result = visualizationDao.getLabelList(visualizationVO);
		
        if (result == null) {
        	return Output.JsonOutput("300", "조회된 라벨 목록이 존재 하지 않습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
		
		return Output.JsonOutput("200", result);
	}
}