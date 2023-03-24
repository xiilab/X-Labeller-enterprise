package com.xlabeller.common.module;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.xlabeller.models.ImExportVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mozilla.universalchardet.UniversalDetector;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.*;

public class CocoExportUtil {
	private List<String> imageList = new ArrayList<String>();
	private Map<String,Integer> imageMap = new HashMap<String,Integer>();
	
	private List<String> categoryList = new ArrayList<String>();
	private Map<String,Integer> categoryMap = new HashMap<String,Integer>();
	
	
	private String NFS_MOUNT_ROOT_PATH = "/xlabeller";
//	private String NFS_MOUNT_ROOT_PATH = "/usr/local/uploadFile/xlabeller";
	private String WORKSPACE_PATH = "/usr/local/uploadFile";
	
	public JSONObject createAll(JSONArray dataArr) {
		JSONObject resultObj = new JSONObject();
		
		
		if(dataArr == null || dataArr.size() <= 0) {
			return null;
		}
		
		initData(dataArr);
		
		resultObj.put("info", createInfo());
		resultObj.put("licenses", createLicenses());
		resultObj.put("categories", createCategories(this.categoryList));
		resultObj.put("images", createImages(this.imageList, "array"));
		resultObj.put("annotations",createAnnotation(dataArr));
		
		return resultObj;
	}

    public JSONObject createAllByList(List<ImExportVO> exportAnnotationList) {
        JSONObject resultObj = new JSONObject();


        if(exportAnnotationList == null || exportAnnotationList.size() <= 0) {
            return null;
        }

        initDataByList(exportAnnotationList);

        resultObj.put("info", createInfo());
        resultObj.put("licenses", createLicenses());
        resultObj.put("categories", createCategories(this.categoryList));
        resultObj.put("images", createImages(this.imageList, "list"));
        resultObj.put("annotations",createAnnotationByList(exportAnnotationList));

        return resultObj;
    }

	public void initData(JSONArray dataArr) {
		JSONObject tempObj = null;
		for(int i = 0 ; i < dataArr.size() ; i++) {
			tempObj = (JSONObject)dataArr.get(i);
			String label = tempObj.get("label").toString();
			String encoding_path = tempObj.get("path").toString();
//			String path = NFS_MOUNT_ROOT_PATH+"/"+encoding_path;
			String path = NFS_MOUNT_ROOT_PATH+"/"+encoding_path;


            addMap(label, path);
        }
	}

    public void initDataByList(List<ImExportVO> exportAnnotationList) {
        for(ImExportVO exportAnnotation : exportAnnotationList) {
            String label = exportAnnotation.getLabel();
            String encoding_path = exportAnnotation.getPath().toString();
            String path = NFS_MOUNT_ROOT_PATH+"/"+encoding_path;

            addMap(label, path);
        }
    }

    private void addMap(String label, String path) {
        if(imageMap.get(path) == null) {
            imageMap.put(path, imageList.size());
            imageList.add(path);
        }
        if(categoryMap.get(label) == null) {
            categoryMap.put(label, categoryList.size());
            categoryList.add(label);
        }
    }


    public JSONObject createInfo() {
		JSONObject resultObj = new JSONObject();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		
		resultObj.put("year", date.getYear());
		resultObj.put("version", "1.0");
		resultObj.put("description", "dataset");
		resultObj.put("contributor", "Xiilab");
		resultObj.put("url", "https://xiilab.com");
		resultObj.put("date_created", dateFormat.format(date));
		
		return resultObj;
		
    }
	
	public JSONArray createLicenses() {
		JSONArray resultArr = new JSONArray();
		
		JSONObject licenseObj = new JSONObject(); 
		
		licenseObj.put("id", 1);
		licenseObj.put("name", "Unknown License");
		licenseObj.put("url", "http://unknown.io");
		resultArr.add(licenseObj);
		
		return resultArr;
		
    }
	
	
	public static JSONArray createCategories(List<String> categoryList) {
		JSONArray resultArr = new JSONArray();		
		
		for(int i = 0 ; i < categoryList.size();i++) {
			JSONObject categoryObj = new JSONObject(); 			
			categoryObj.put("id", i);
			categoryObj.put("name", categoryList.get(i));
			categoryObj.put("supercategory", "");
			resultArr.add(categoryObj);
		}

		return resultArr;
    }
	
	public JSONArray createImages(List<String> imageList, String type) {
		try {
			JSONArray resultArr = new JSONArray();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String dateCaptured = dateFormat.format(date);

			BufferedImage bi = null;
			for(int i = 0 ; i < imageList.size();i++) {
				JSONObject imageObj = new JSONObject();
				String filePath = WORKSPACE_PATH + imageList.get(i);
				System.out.println(filePath);
				bi = ImageIO.read(new File(filePath));
				imageObj.put("id", i);
				imageObj.put("width", bi.getWidth());
				imageObj.put("height", bi.getHeight());
				if (type.equals("array")) {
					imageObj.put("file_name", imageList.get(i));
				} else if(type.equals("list")) {
					imageObj.put("file_name", imageList.get(i).split("/")[imageList.get(i).split("/").length - 1]);
				}
				imageObj.put("license", 1);
				imageObj.put("date_captured", dateCaptured);
				
				resultArr.add(imageObj);
			}

			System.out.println(resultArr.toJSONString());
			return resultArr;
		}catch(Exception e) {
			e.printStackTrace();	
			return null;
		}
		
    }
	
	
	public JSONArray createAnnotation(JSONArray dataArr) {
		try {
			JSONArray resultArr = new JSONArray();		
			JSONObject tempObj = null;
			
			for(int i = 0 ; i < dataArr.size();i++) {
				JSONObject annotationObj = new JSONObject();
				
				tempObj = (JSONObject)dataArr.get(i);
				String label = tempObj.get("label").toString();
				String path = NFS_MOUNT_ROOT_PATH+"/"+tempObj.get("path").toString();
							
				int imageId = imageMap.get(path).intValue();
				int categoryId = categoryMap.get(label).intValue();
				JSONArray bbox = new JSONArray();
				
				double x = Double.valueOf(tempObj.get("x").toString()).doubleValue();
				double y = Double.valueOf(tempObj.get("y").toString()).doubleValue();
				double w = Double.valueOf(tempObj.get("w").toString()).doubleValue();
				double h = Double.valueOf(tempObj.get("h").toString()).doubleValue();
				
				
				JsonParser jp = new JsonParser();
				JSONParser jp1 = new JSONParser();
				
				String strSegmentation = tempObj.get("segmentation").toString();
				
				JsonArray tempJa = jp.parse(strSegmentation).getAsJsonArray();
				JSONArray tempSegmentation = (JSONArray)jp1.parse(tempJa.toString());
				
				bbox.add(x);
				bbox.add(y);
				bbox.add(w);
				bbox.add(h);
				
				
				JSONArray seg = new JSONArray();
				JSONArray segWrap = new JSONArray();
				
				for(int j = 0 ; j < tempSegmentation.size();j++) {
					JSONObject tempSegObj = (JSONObject)tempSegmentation.get(j);
					seg.add(tempSegObj.get("x"));
					seg.add(tempSegObj.get("y"));
				}
				segWrap.add(seg);
				
				annotationObj.put("segmentation",segWrap);
				annotationObj.put("area", w*h);
				annotationObj.put("image_id",imageId );
				annotationObj.put("bbox", bbox);
				annotationObj.put("category_id",categoryId );
				
				
				annotationObj.put("id", i);
				annotationObj.put("iscrowd", 0);
				
				
				resultArr.add(annotationObj);
			}
			return resultArr;
		}catch(Exception e) {
			e.printStackTrace();	
			return null;
		}
    }

    public JSONArray createAnnotationByList(List<ImExportVO> exportAnnotationList) {
        try {
            JSONArray resultArr = new JSONArray();
            for(ImExportVO exportAnnotation : exportAnnotationList) {
                JSONObject resultObj = new JSONObject();

                // annotations['image_id']와 annotation['category_id'] 추출
                String path = NFS_MOUNT_ROOT_PATH + "/" + exportAnnotation.getPath();
                String label = exportAnnotation.getLabel();
                int imageId = imageMap.get(path);
                int categoryId = categoryMap.get(label);

                // annotation['bbox'], annotation['segmentation'] 추출
                String info = exportAnnotation.getInfo();
                double x = 0, y =0, w = 0, h = 0;
                // annotation['bbox']로 저장될 변수
                JSONArray bboxArray = new JSONArray();
                // annotation['segmentation']로 저장될 변수
                JSONArray pointsArray = new JSONArray();
                int index = 0;
                if (exportAnnotation.getLabel_type().equals("IMAGE_BBOX")) {
                    // 라벨타입이 BBOX인 경우, x,y,w,h로 저장되어 있는 값을 ","기준으로 잘라, 하나씩 값을 꺼내옴
                    String[] splitBbox = info.split(",");
                    x = Double.parseDouble(splitBbox[0]);
                    y = Double.parseDouble(splitBbox[1]);
                    w = Double.parseDouble(splitBbox[2]);
                    h = Double.parseDouble(splitBbox[3]);
                } else {
                    // info에 저장된 JSON문자열을 정렬된 형태의 JSONArray로 저장하기 위한 parser
                    JsonParser sortSegJsonParser = new JsonParser();
                    // 정렬된 JSONArray를 다시 JSON형태로 변환하기 위한 parser
                    // 이유? JsonParser는 gson라이브러리를 사용하는데 최종적으로 반환하는 데이터 타입은 simple json라이브러리라 변환이 필요함
                    JSONParser segJsonParser = new JSONParser();
                    // 정렬된 JSONArray 형태로 반환
                    JsonArray infoSegJsonArray = sortSegJsonParser.parse(info).getAsJsonArray();
                    // 위에서 정렬한 spimple json에서 지원하는 JSONArray형태를 다시 변환
                    JSONArray tempSegmentation = (JSONArray)segJsonParser.parse(infoSegJsonArray.toString());
                    // JSONArray의 0번째 원소 가져옴
                    JSONObject infoJsonObj = (JSONObject)tempSegmentation.get(0);
                    // 0번째 원소의 segmentation 가져옴
                    JSONArray segJsonArray = (JSONArray)infoJsonObj.get("segmentation");
                    // 0번째 원소의 box 가져옴
                    //String[] splitBbox = infoJsonObj.get("box").toString().split(",");
					double x1 = 0, y1 = 0, x2 = 0, y2 = 0;
                    // bbox 값
//                    x = Double.parseDouble(splitBbox[0]);
//                    y = Double.parseDouble(splitBbox[1]);
//                    w = Double.parseDouble(splitBbox[2]);
//                    h = Double.parseDouble(splitBbox[3]);
                    // seg 값
                    for(int j = 0 ; j < segJsonArray.size();j++) {
                        JSONObject tempSegObj = (JSONObject)segJsonArray.get(j);
						double pointX = (double) tempSegObj.get("x");
						double pointY = (double) tempSegObj.get("y");
						x1 = (j == 0 || x1 > pointX) ? pointX : x1;
						x2 = (j == 0 || x2 < pointX) ? pointX : x2;
						y1 = (j == 0 || y1 > pointY) ? pointY : y1;
						y2 = (j == 0 || y2 < pointY) ? pointY : y2;
						pointsArray.add(pointX);
						pointsArray.add(pointY);
                    }

					x = x1;
					y = y1;
					w = x2 - x1;
					h = y2 - y1;
                }

                bboxArray.add(x);
                bboxArray.add(y);
                bboxArray.add(w);
                bboxArray.add(h);

				JSONArray segWrap = new JSONArray();
				if(pointsArray.size() > 0) {
					segWrap.add(pointsArray);
				}
                resultObj.put("segmentation",segWrap);
                resultObj.put("image_id",imageId );
                resultObj.put("bbox", bboxArray);
                resultObj.put("category_id",categoryId);

                resultObj.put("id", index);
				resultArr.add(resultObj);
                index++;
            }
            return resultArr;
        }catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}