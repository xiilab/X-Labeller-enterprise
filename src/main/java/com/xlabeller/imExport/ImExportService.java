package com.xlabeller.imExport;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.common.module.*;
import com.xlabeller.data.DataDao;
import com.xlabeller.data.DataService;
import com.xlabeller.meta.MetaDao;
import com.xlabeller.models.*;
import lombok.RequiredArgsConstructor;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
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
import java.nio.file.Files;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
		if(imExportVO.getDataset_ids() == null || imExportVO.getDataset_ids().length() < 1) {
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
		CocoUtil cocoUtil = new CocoUtil();
		JSONObject exportCocoJson = cocoUtil.createAllByList(exportAnnotationList);

		// 4. json + image zip파일로 다운로드
		String saveZipFileName = "exports_coco.zip";
		byte[] jsonBytes = exportCocoJson.toJSONString().getBytes();
		ZipUtil zipUtil = new ZipUtil();
		zipUtil.putEntry("coco.json", jsonBytes);
		for(String filePath : imagePathList) {
			InputStream in = new FileInputStream(filePath);
			zipUtil.putEntry(filePath.split("/")[filePath.split("/").length - 1], IOUtils.toByteArray(in));
		}
		zipUtil.close();

		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment; fileName=" + saveZipFileName);
		response.getOutputStream().write(zipUtil.getZipOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();

		logger.info(exportCocoJson.toJSONString());
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
		ZipInputStream zis = null; // 업로드한 zip파일 inputStream
		ZipEntry entry = null; // 업로드한 zip파일에 압축된 항목 하나씩 가져와 저장하는 변수
		List<File> imageFiles = new ArrayList<>(); // 압축된 이미지 목록 저장하는 List
		File cocoJson = null; // 압축된 json파일 저장하는 객체
		boolean cocoJsonIsExists = false; // 압축파일에 json존재하는지 체크

		try {
			zis = new ZipInputStream(importZipFile.getInputStream());
			while ((entry = zis.getNextEntry()) != null) {
				// 압축된 파일 포맷 검사
				String entryExtension = getExtensionValid(new String[]{"png", "jpg", "jpeg", "json"}, entry.getName());

				// json파일 있는지 검사
				if(entryExtension.equals("json")) {
					cocoJson = new File(entry.getName());
					// json파일 있으면 boolean값 변경
					cocoJsonIsExists = true;
					// json 파일은 이미지 목록 리스트에 추가 X
					continue;
				}

				// 위에 검증 로직 통과하면 image로 판단하여 list에 추가
				File file = new File(entry.getName());
				imageFiles.add(file);
			}
		} catch (IOException e) {
			throw new HandlerCustomException("4051", "import하려는 zip파일이 손상되어 압축 해제할 수 없습니다.\n다른 파일을 업로드해주세요.");
		}

		// zip에 json파일 없으면 에러처리
		if(!cocoJsonIsExists) {
			throw new HandlerCustomException("4051", "zip파일에 json파일이 존재하지 않습니다.\nzip파일을 확인해주세요.");
		}
		// zip에 image 없으면 에러처리
		if(imageFiles.size() <= 0) {
			throw new HandlerCustomException("4051", "zip파일에 이미지파일이 존재하지 않습니다.\nzip파일을 확인해주세요.");
		}

		// 3. coco.json파일 읽어서 필요한 항목 추출
		String content = FileUtils.readFileToString(cocoJson, "UTF-8");
		// 읽어온 텍스트 json형식으로 변환
		JSONParser cocoJsonParser = new JSONParser();
		JSONObject cocoJsonObj = null;
		try {
			// coco.json읽어서 JSON형태로 변환
			cocoJsonObj = (JSONObject)cocoJsonParser.parse(content);
		} catch (ParseException e) {
			throw new HandlerCustomException("4051", "zip파일에 포함된 json파일이 손상되어 JSON형식으로 변환할 수 없습니다.\n파일을 다시 확인해주세요.");
		}

		// Coco모듈 형식에서 필요한 항목 추출
		CocoImportUtil cocoImportUtil = new CocoImportUtil(cocoJsonObj);
		cocoImportUtil.readCocoJson(labelType);	// labelType별로 json파일에서 필요한 항목 읽어서 값 세팅
		Map<String, JSONArray> cocoAnnotationImagesMap = cocoImportUtil.getAnnotationImagesMap();	// annotation-images 추출

		// 4. 이미지 파일 저장 및 데이터셋, 데이터 DB에 저장
		// file객체 MultipartFile로 변환
		// why? Dataservice.insertDataset을 재활용하기 위함
		List<MultipartFile> multipartFileList = new ArrayList<>();
		for (File file : imageFiles) {
			// 어노테이션 없는 이미지 파일이면 저장할 파일 목록에서 제외
			if(cocoAnnotationImagesMap.containsKey(file.getName())) {
				MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getPath(), "UTF-8", new FileInputStream(file));
				multipartFileList.add(multipartFile);
			}
		}
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

		// 5. annotation 등록, META테이블에 annotation 저장
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

	private void cocoImportMeta(String dataId, String labelType, JSONArray jsonArray) {
		List<MetaVO> insertMetaList = new ArrayList<>();
		for(int i = 0; i < jsonArray.size(); i++) {
			JSONObject annotationObj = (JSONObject) jsonArray.get(i);
			MetaVO metaVO = new MetaVO();
			if(labelType.equals("IMAGE_BBOX")) {
				String info = annotationObj.get("info").toString();
				String label = annotationObj.get("label").toString();

				metaVO.setData_id(dataId);
				//metaVO.setUser_id(SessionUtil.getUserInfo().getUser_id());
				metaVO.setLabel_type(labelType);
				metaVO.setInfo(info);
				metaVO.setLabel(label);
				insertMetaList.add(metaVO);
			} else if(labelType.equals("IMAGE_SEGMENTATION")){
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