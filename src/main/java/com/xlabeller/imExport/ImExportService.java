package com.xlabeller.imExport;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.common.module.*;
import com.xlabeller.data.DataDao;
import com.xlabeller.data.DataService;
import com.xlabeller.meta.MetaDao;
import com.xlabeller.models.*;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

@Service
@RequiredArgsConstructor
public class ImExportService {
    private final ImExportDao imExportDao;
    private final DataService dataService;
    private final DataDao dataDao;
    private final MetaDao metaDao;

    private static Logger logger = Logger.getLogger(ImExportService.class);
    private String NFS_MOUNT_ROOT_PATH = "/xlabeller";
    //	private String NFS_MOUNT_ROOT_PATH = "/usr/local/uploadFile/xlabeller";
    private String WORKSPACE_PATH = "/usr/local/uploadFile";

    public void exportCoco(ImExportVO imExportVO, HttpServletResponse response) throws HandlerCustomException, IOException {
        // 1. DatasetIds 파라미터 유효성 검사
        if (imExportVO.getDataset_ids() == null || imExportVO.getDataset_ids().length() < 1) {
            throw new HandlerCustomException("4061", "추출할 데이터셋 ID가 존재하지 않습니다.\n 새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        // 2. datasetIds를 WHERE절에 넘겨, DATASET, DATA, META가 JOIN된 데이터 출력
        List<ImExportVO> exportAnnotationList = imExportDao.getExportAnnotationData(imExportVO);
        // 중복된 이미지 경로 제거 후 String List로 반환
        List<String> imagePathList = exportAnnotationList.stream()
                .map((vo) -> {
                    return WORKSPACE_PATH + NFS_MOUNT_ROOT_PATH + "/" + vo.getPath();
                })
                .distinct()
                .collect(Collectors.toList());

        // 3. COCO형태로 변환
        CocoExportUtil cocoExportUtil = new CocoExportUtil();
        JSONObject exportCocoJson = cocoExportUtil.createAllByList(exportAnnotationList);

        // 4. json + image zip파일로 다운로드
        String saveZipFileName = "exports_coco.zip";
        byte[] jsonBytes = exportCocoJson.toJSONString().getBytes();
        ZipUtil zipUtil = new ZipUtil();
        zipUtil.putEntry("coco.json", jsonBytes);
        for (String imagePath : imagePathList) {
            InputStream in = new FileInputStream(imagePath);
            zipUtil.putEntry(Paths.get(imagePath).getFileName().toString(), IOUtils.toByteArray(in));
        }
        zipUtil.close();

        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment; fileName=" + saveZipFileName);
        try (OutputStream out = response.getOutputStream()) {
            out.write(zipUtil.getZipOutputStream());
        }
    }

    public Object importCoco(ImExportVO imExportVO) throws HandlerCustomException, IOException {
        // 1. 파라미터 및 import하려는 파일이 zip파일인지 유효성 검사
        MultipartFile importZipFile = imExportVO.getImport_zip_file();
        String labelType = imExportVO.getLabel_type();
        String title = imExportVO.getTitle();
        String contents = imExportVO.getContents();

        // 업로드한 파일 zip포맷인지 유효성 검사
        getExtensionValid(new String[]{"zip"}, importZipFile.getOriginalFilename());

        // 2. zip파일 압축해제 후 List<File>에 File객체 추가
//		ZipInputStream zis = null; // 업로드한 zip파일 inputStream
//		ZipEntry entry = null; // 업로드한 zip파일에 압축된 항목 하나씩 가져와 저장하는 변수
        Map<String, byte[]> imageMap = new HashMap<>(); // 압축된 이미지 목록 저장하는 Map
        boolean cocoJsonIsExists = false; // 압축파일에 json존재하는지 체크
        String jsonContent = null;    // json 파일에 있는 내용 문자열로 변환하여 저장

        try (ZipInputStream zis = new ZipInputStream(importZipFile.getInputStream())) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (entryValidate(entry)) continue;

                // check if the entry is a valid image file
                String[] validExtensions = {"png", "jpg", "jpeg", "json"};
                String extension = getExtensionValid(validExtensions, entry.getName());

                // json파일 있는지 3검사
                if (extension.equals("json")) {
                    jsonContent = IOUtils.toString(zis, StandardCharsets.UTF_8);
                    // json파일 있으면 boolean값 변경
                    cocoJsonIsExists = true;
                    // json 파일은 이미지 목록 리스트에 추가 X
                    continue;
                }

                // ZipEntry의 내용을 byte 배열로 가져옴
                byte[] bytes = IOUtils.toByteArray(zis);

//				// 위에 검증 로직 통과하면 image로 판단하여 map에 추가
//				// imageMap = (key : fileName, value : image byte[])
                imageMap.put(entry.getName(), bytes);
            }
        } catch (IOException e) {
            throw new HandlerCustomException("4051", "Failed to read the zip file");
        }

        // zip에 json파일 없으면 에러처리
        if (!cocoJsonIsExists) {
            throw new HandlerCustomException("4051", "zip파일에 json파일이 존재하지 않습니다.\nzip파일을 확인해주세요.");
        }

        // zip에 image 없으면 에러처리
        if (imageMap.size() <= 0) {
            throw new HandlerCustomException("4051", "zip파일에 이미지파일이 존재하지 않습니다.\nzip파일을 확인해주세요.");
        }

        // 3. json문자열 JSON형식으로 변환
        // 읽어온 텍스트 json형식으로 변환
        JSONParser cocoJsonParser = new JSONParser();
        JSONObject cocoJsonObj = null;
        try {
            // coco.json읽어서 JSON형태로 변환
            cocoJsonObj = (JSONObject) cocoJsonParser.parse(jsonContent);
        } catch (ParseException e) {
            throw new HandlerCustomException("4051", "zip파일에 포함된 json파일이 손상되어 JSON형식으로 변환할 수 없습니다.\n파일을 다시 확인해주세요.");
        }

        // 모듈에서 coco.json에서 필요한 항목 추출
        CocoImportUtil cocoImportUtil = new CocoImportUtil(cocoJsonObj);
        cocoImportUtil.readCocoJson(labelType);    // labelType별로 json파일에서 필요한 항목 읽어서 값 세팅
        Map<String, JSONArray> cocoAnnotationImagesMap = cocoImportUtil.getAnnotationImagesMap();    // annotation-images 추출

        // 4. 이미지 파일 저장 및 데이터셋, 데이터 DB에 저장
        // file객체 MultipartFile로 변환
        // why? Dataservice.insertDataset을 재활용하기 위함
        List<MultipartFile> multipartFileList = new ArrayList<>();
        imageMap.entrySet().forEach((map) -> {
            if (cocoAnnotationImagesMap.containsKey(map.getKey())) {
                MultipartFile multipartFile = new MockMultipartFile(map.getKey(), map.getKey(), "UTF-8", map.getValue());
                multipartFileList.add(multipartFile);
            }
        });

        MultipartFile[] imageFilesArray = multipartFileList.toArray(new MultipartFile[multipartFileList.size()]);

        // Dataset 및 Data 등록
        DatasetVO insertDatasetVO = new DatasetVO();
        insertDatasetVO.setTitle(title);
        insertDatasetVO.setContents(contents);
        insertDatasetVO.setFiles(imageFilesArray);
        insertDatasetVO.setMedia_type("IMAGE");
        insertDatasetVO.setLabel_type(labelType);
        try {
            dataService.insertDataset(insertDatasetVO);
        } catch (Exception e) {
            throw new HandlerCustomException("500", "COCO Import 데이터셋 등록에 실패했습니다.");
        }

        // 5. label 등록, META테이블에 label 저장
        // 등록한 데이터셋의 모든 이미지 목록 가져옴
        DataVO selectDataVO = new DataVO();
        selectDataVO.setDataset_id(insertDatasetVO.getDataset_id());
        List<DataVO> dataList = dataDao.getDataList(selectDataVO);
        dataList.stream().forEach(dataVO -> {
            JSONArray imageAnnotationArray = cocoAnnotationImagesMap.get(dataVO.getFilename());
            cocoImportMeta(dataVO.getData_id(), labelType, imageAnnotationArray);
        });

        return Output.JsonOutput("200", "COCO형식으로 Import가 완료되었습니다.");
    }

    private boolean entryValidate(ZipEntry entry) {
        if (entry.getName().contains("_MACOSX")) {
            return true;
        }
        if (entry.getName().contains(".DS_Store")) {
            return true;
        }
        if (entry.isDirectory()) {
            return true;
        }
        return false;
    }

    private String getExtensionValid(String[] acceptExtension, String fileName) {
        // 파일 포맷 추출
        String extension = Optional.ofNullable(FilenameUtils.getExtension(fileName))
                .map(String::toLowerCase)
                .orElseThrow(() -> {
                    throw new HandlerCustomException("4051", "COCO zip파일에 부적절한 포맷을 가진 파일이 존재합니다.\nzip파일을 확인해주세요.");
                });
        // 허용된 파일 포맷이 아닐 경우, 에러처리
        if (!Arrays.asList(acceptExtension).contains(extension)) {
            throw new HandlerCustomException("4051", "COCO zip파일에 부적절한 포맷을 가진 파일이 존재합니다.\nzip파일을 확인해주세요.");
        }

        return extension;
    }

    public void exportVoc(ImExportVO imExportVO, HttpServletResponse response) throws HandlerCustomException, IOException {
        // 1. DatasetIds 파라미터 유효성 검사
        if (imExportVO.getDataset_ids() == null || imExportVO.getDataset_ids().length() < 1) {
            throw new HandlerCustomException("4061", "추출할 데이터셋 ID가 존재하지 않습니다.\n 새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        // 2. datasetIds를 WHERE절에 넘겨, DATASET, DATA, META가 JOIN된 데이터 출력
        List<ImExportVO> exportAnnotationList = imExportDao.getExportAnnotationData(imExportVO);

        // 3. VOC형태로 변환
        VocExportUtil vocExportUtil = new VocExportUtil();
        vocExportUtil.createData(exportAnnotationList);
        // Annotations 디렉토리에 넣을 XML파일의 byte[]
        Map<String, byte[]> exportVocXmlMap = vocExportUtil.getExportVocXmlMap();
        // ImageSets/Main 디렉토리에 txt로 저장할 파일명 목록, JPEGImages 디렉토리에 넣을 원본 파일의 경로
        Map<String, String> exportAllImageNameMap = vocExportUtil.getExportAllImageNameMap();
        // ImageSets/Segmentation 디렉토리에 txt로 저장할 파일명 목록
        Map<String, JSONArray> exportSegImageLabelInfoMap = vocExportUtil.getExportSegImageLabelInfoMap();
        // SegmentationObject 디렉토리에 저장할 파일의 byte[]
        Map<String, byte[]> exportSegObjectImageMap = vocExportUtil.getExportSegObjectImageMap();

        // 4. Zip파일에 디렉토리 추가
        String saveZipFileName = "exports_voc.zip";
        String rootDir = "exports_voc/";
        String vocDir = rootDir + "VOC/";
        String annotationsDir = vocDir + "Annotations/";
        String imageSetsDir = vocDir + "ImageSets/";
        String mainDir = imageSetsDir + "main/";
        String segmentationDir = imageSetsDir + "Segmentation/";
        String jpegImagesDir = vocDir + "JPEGImages/";
        String segmentationObjectDir = vocDir + "SegmentationObject/";

        ZipUtil zipUtil = new ZipUtil();
        zipUtil.putDirectoryEntry(vocDir);
        zipUtil.putDirectoryEntry(annotationsDir);
        zipUtil.putDirectoryEntry(imageSetsDir);
        zipUtil.putDirectoryEntry(mainDir);
        zipUtil.putDirectoryEntry(segmentationDir);
        zipUtil.putDirectoryEntry(jpegImagesDir);
        zipUtil.putDirectoryEntry(segmentationObjectDir);

        // Annotation 디렉토리에 바운딩박스 정보 xml파일로 생성
        exportVocXmlMap.entrySet().forEach((map) -> {
            String fileFullPath = annotationsDir + map.getKey() + ".xml";
            zipUtil.putEntry(fileFullPath, map.getValue());
        });

        // ImageSets/Main 디렉토리에 모든 파일명 목록 저장
        List<String> allImageNameList = new ArrayList<>(exportAllImageNameMap.keySet());
        String allImageName = String.join("\n", allImageNameList);
        String allImageTxtPath = mainDir + "VOC.txt";
        zipUtil.putEntry(allImageTxtPath, allImageName.getBytes());

        // ImageSets/Main 디렉토리에 모든 파일명 목록 저장
        List<String> allSegImageNameList = new ArrayList<>(exportSegImageLabelInfoMap.keySet());
        String allSegImageName = String.join("\n", allSegImageNameList);
        String allSegImageTxtPath = segmentationDir + "VOC.txt";
        zipUtil.putEntry(allSegImageTxtPath, allSegImageName.getBytes());

        // JPEGImages 디렉토리에 모든 이미지 파일 저장
        exportAllImageNameMap.values().forEach((value) -> {
            try {
                InputStream in = new FileInputStream(value);
                zipUtil.putEntry(jpegImagesDir + Paths.get(value).getFileName().toString(), IOUtils.toByteArray(in));
            } catch (IOException e) {
                throw new HandlerCustomException("500", "VOC를 추출하는 과정에서 오류가 발생하였습니다.");
            }
        });

        // Annotation 디렉토리에 바운딩박스 정보 xml파일로 생성
        exportSegObjectImageMap.entrySet().forEach((map) -> {
            String fileFullPath = segmentationObjectDir + map.getKey() + ".png";
            zipUtil.putEntry(fileFullPath, map.getValue());
        });

		zipUtil.close();

		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment; fileName=" + saveZipFileName);
		try (OutputStream out = response.getOutputStream()) {
			out.write(zipUtil.getZipOutputStream());
		}
    }

    private void cocoImportMeta(String dataId, String labelType, JSONArray jsonArray) {
        List<MetaVO> insertMetaList = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject annotationObj = (JSONObject) jsonArray.get(i);
            MetaVO metaVO = new MetaVO();
            if (labelType.equals("IMAGE_BBOX")) {
                String info = annotationObj.get("info").toString();
                String label = annotationObj.get("label").toString();

                metaVO.setData_id(dataId);
                //metaVO.setUser_id(SessionUtil.getUserInfo().getUser_id());
                metaVO.setLabel_type(labelType);
                metaVO.setInfo(info);
                metaVO.setLabel(label);
                insertMetaList.add(metaVO);
            } else if (labelType.equals("IMAGE_SEGMENTATION")) {
                String label = annotationObj.get("label").toString();
                JSONArray info = new JSONArray();
                JSONObject infoObj = (JSONObject) annotationObj.get("info");
                info.add(infoObj);

                metaVO.setData_id(dataId);
                //metaVO.setUser_id(SessionUtil.getUserInfo().getUser_id());
                metaVO.setLabel_type(labelType);
                metaVO.setInfo(info.toJSONString());
                metaVO.setLabel(label);
                insertMetaList.add(metaVO);
            }
        }

        // Meta등록
        MetaVO insertMetaVO = new MetaVO();
        insertMetaVO.setMeta_list(insertMetaList);
        metaDao.insertMetaList(insertMetaVO);
    }
}