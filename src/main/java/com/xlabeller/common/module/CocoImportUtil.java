package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.stream.Collectors;

public class CocoImportUtil {
    private JSONObject cocoJsonObject;
    // imagesMap : json파일의 images항목을 모두 읽어 map로 변환
    // key : IMAGE_ID, value : FILE_NAME
    private Map<Long, String> imagesMap;
    // categoriesMap : json파일의 categories항목을 모두 읽어 map로 변환
    // key : CATEGORY_ID, value : LABEL_NAME
    private Map<Long, String> categoriesMap;
    // annotationMap = json파일의 annotations항목을 모두 읽어 map로 변환
    // key : FILE_NAME, value : (labelType.equals("IMAGE_BBOX"))? [{bbox: [], label: ""}] : [{segmentation: [], bbox: [], label: ""}]
    private Map<String, JSONArray> annotationMap;
    // 어노테이션이 생성된 image들만 map로 생성
    // imagesMap  = key : FILE_NAME, value : JSONArray(어노테이션 정보)
    private Map<String, JSONArray> annotationImagesMap;
    private String labelType;
    private static Logger logger = Logger.getLogger(CocoImportUtil.class);

    public CocoImportUtil(JSONObject cocoJsonObject) {
        this.cocoJsonObject = cocoJsonObject;
        this.imagesMap = new HashMap<>();
        this.categoriesMap = new HashMap<>();
    }

    public void readCocoJson(String labelType) {
        this.labelType = labelType;
        readCocoImages();
        readCocoCategories();
        readCocoAnnotations();
    }

    private void readCocoImages() {
        Map<Long, String> resultMap = new HashMap<>();
        JSONArray imagesJsonArray = (JSONArray) cocoJsonObject.get("images");

        for(int i = 0; i < imagesJsonArray.size(); i++) {
            JSONObject imageJsonObj = (JSONObject) imagesJsonArray.get(i);
            Long image_id = (Long)imageJsonObj.get("id");
            String fileName = (String)imageJsonObj.get("file_name");
            resultMap.put(image_id, fileName);
        }

        this.imagesMap = resultMap;
    }

    private void readCocoCategories() {
        Map<Long, String> resultMap = new HashMap<>();
        JSONArray categoriesJsonArray = (JSONArray) cocoJsonObject.get("categories");

        for(int i = 0; i < categoriesJsonArray.size(); i++) {
            JSONObject imageJsonObj = (JSONObject) categoriesJsonArray.get(i);
            Long id = (Long)imageJsonObj.get("id");
            String name = (String)imageJsonObj.get("name");
            resultMap.put(id, name);
        }

        this.categoriesMap = resultMap;
    }

    private void readCocoAnnotations() {
        // imagesMap의 value(image_id)를 키로 가지는 map 생성
        // key : FILE_NAME, value : (labelType.equals("IMAGE_BBOX"))? [{bbox: [], label: ""}] : [{segmentation: [], bbox: [], label: ""}]
        Map<String, JSONArray> resultMap = this.imagesMap.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getValue,
                        (e) -> new JSONArray()
                ));
        JSONArray annotationsJsonArray = (JSONArray) cocoJsonObject.get("annotations");

        for(int i = 0; i < annotationsJsonArray.size(); i++) {
            JSONObject imageJsonObj = (JSONObject) annotationsJsonArray.get(i);
            // label name 추출
            Long categoryId = (Long)imageJsonObj.get("category_id");
            String labelName = this.categoriesMap.get(categoryId);
            Long imageId = (Long)imageJsonObj.get("image_id");
            JSONObject annotationObj = new JSONObject();
            if(this.labelType.equals("IMAGE_BBOX")) {
                if(!isValidCocoAnnotations(imageJsonObj, "IMAGE_BBOX")) {
                    continue;
                }
                JSONArray bbox = (JSONArray)imageJsonObj.get("bbox");
                if (bbox.size() != 4 ) {
                    continue;
                }

                annotationObj.put("info", bbox.toJSONString().replaceAll("[\\[\\]]", ""));
                /**
                 * annotationObj 저장형식
                 * {
                 *      "label":"2355",
                 *      "info":"192.44679592026708,113.94716959707391,169.48221378150123,139.07111479523752"
                 *  }
                 * */
            } else {
                if(!isValidCocoAnnotations(imageJsonObj, "IMAGE_SEGMENTATION")) {
                    continue;
                }
                String bbox = ((JSONArray)imageJsonObj.get("bbox")).toJSONString().replaceAll("[\\[\\]]", "");
                JSONArray segmentation = (JSONArray)imageJsonObj.get("segmentation");
                JSONArray pointSegmentation = new JSONArray();
                JSONObject pointJson = new JSONObject();
                for(int j = 0; j < segmentation.size(); j++) {
                    JSONArray segmentationObjArray = (JSONArray) segmentation.get(j);
                    for (int k = 0; k < segmentationObjArray.size(); k++) {
                        Double point = Double.parseDouble(segmentationObjArray.get(k).toString());
                        if(k % 2 == 0) {
                            pointJson.put("x", point);
                        } else {
                            pointJson.put("y", point);
                            pointSegmentation.add(pointJson);
                            pointJson = new JSONObject();
                        }
                    }
                }

                JSONObject infoObj = new JSONObject();
                infoObj.put("box", bbox);
                infoObj.put("segmentation", pointSegmentation);
                annotationObj.put("info", infoObj);
                /**
                 * annotationObj 저장 형식
                 * {
                 * 	"label":"1234",
                 * 	"info":
                 *        {
                 * 		    "segmentation":[
                 *            {"x":449.12396202013133,"y":132.03491866310222},
                 *            {"x":312.57051395825584,"y":192.15919803362948},
                 *            {"x":217.79834478098405,"y":287.95042279345256}
                 * 		    ],
                 * 		"box":"221.89421167660376,134.41551703636426,235.9521295839302,159.03381421295734"
                 *      }
                 * }
                 * */
            }

            annotationObj.put("label", labelName);
//            logger.info(annotationObj.toJSONString());

            // resultMap에 annotationObj 넣음
            String fileName = this.imagesMap.get(imageId);
            resultMap.get(fileName).add(annotationObj);
        }

        // coco annotation 원본 그대로 유지하기 위해 복사
        Map<String, JSONArray> copyResultMap = resultMap.entrySet().stream().collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

        // 어노테이션이 존재하지 않는 이미지ID Key 삭제
        Iterator<Map.Entry<String, JSONArray>> iterator = resultMap.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, JSONArray> entry = iterator.next();
            if (entry.getValue().isEmpty()) {
                iterator.remove();
            }
        }

        // annotation 존재하는 이미지만 map로 저장, 이미지에 어노테이션이 존재하더라도 label_type에 저장되지 않을 수 있음

/*        this.annotationImagesMap = this.imagesMap.entrySet()
                .stream()
                .filter((e) -> !resultMap.containsKey(e.getValue()))
                .collect(Collectors.toMap(
                        (e) -> e.getValue()
                        (e) -> resultMap.get(e.)
                ));*/
        this.annotationImagesMap = resultMap;
        this.annotationMap = copyResultMap;
    }

    // LabelType별로 다르게 유효성검사 실시
    public boolean isValidCocoAnnotations(JSONObject imageJsonObj, String labelType) {
        boolean isValid = false;
        if(labelType.equals("IMAGE_BBOX")) {
            // bbox값이 있는지 확인
            if(imageJsonObj.get("bbox") == null || !JSONArray.class.isInstance(imageJsonObj.get("bbox"))) {
                return isValid;
            }
            // seg값이 있으면 segemntation으로 판단
            if(imageJsonObj.get("segmentation") == null || ((JSONArray)imageJsonObj.get("segmentation")).size() > 0) {
                return isValid;
            }
        } else if(labelType.equals("IMAGE_SEGMENTATION")) {
            // bbox값이 있는지 확인, JSONArray로 변환할 수 있는지 확인
            if(imageJsonObj.get("bbox") == null || !JSONArray.class.isInstance(imageJsonObj.get("bbox"))) {
                return isValid;
            }
            // seg 있는지 확인, JSONArray로 변환할 수 있는지 확인
            if(imageJsonObj.get("segmentation") == null || !JSONArray.class.isInstance(imageJsonObj.get("segmentation"))) {
                return isValid;
            }
            // seg 값이 비어있는지 확인
            if(((JSONArray)imageJsonObj.get("segmentation")).size() <= 0) {
                return isValid;
            }
        }

        return !isValid;
    }

    public Map<Long, String> getImagesMap() {
        return imagesMap;
    }

    public Map<Long, String> getCategoriesMap() {
        return categoriesMap;
    }

    public Map<String, JSONArray> getAnnotationMap() {
        return annotationMap;
    }

    public Map<String, JSONArray> getAnnotationImagesMap() {
        return annotationImagesMap;
    }
}
