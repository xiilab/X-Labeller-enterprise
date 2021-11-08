package com.xlabeller.common.module;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONArray;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;



public class ExcelWriter {

	private Object result;
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private int rowNum = 1;
	private XSSFRow headerRow;

	private JSONArray arr_data;
	private String path;
	private String flag;
	private String[] header_list;

	public ExcelWriter(Object result, String[] header_list, String path, String flag) {
		this.header_list = header_list;
		this.path = path;
		this.flag = flag;
		this.result = result;
	}

	// 오브젝트 확인
	private JSONArray checkObject() {
		if (result instanceof JSONArray) {
			return (JSONArray) result;
		} else {
			return null;
		}
	}

	// 데이터 세팅
	private Boolean initData() {

		// JSONOBject 인지 확인
		arr_data = checkObject();

		if (arr_data == null) {
			return false;
		}

		workbook = new XSSFWorkbook();
		// 엑셀 sheet 생성
		sheet = workbook.createSheet("excel");

		return true;
	}

	// 엑셀 생성
	public boolean createExcel() throws FileNotFoundException, IOException {

		if (!initData()) {
			return false;
		}

		if (flag.equals("true")) {
			// 엑셀 헤더 추가
			setHeader();
			setExcelData();
		} else {
			setExcelData();
		}

		if (!saveExcelFile()) {
			return false;
		} else {
			return true;
		}
	}

	// 헤더 생성
	private void setHeader() {
		headerRow = sheet.createRow(0);
		for (int i = 0; i < header_list.length; i++) {
			XSSFCell cell = headerRow.createCell(i);
			cell.setCellValue(header_list[i]);
		}
	}

	// 엑셀 데이터 파싱 헤더면 true 아니면 false
	private void setExcelData() {

		for (int i = 0; i < arr_data.size(); i++) {
			Row row = sheet.createRow(rowNum++);

			HashMap<?, ?> obj = (HashMap<?, ?>) arr_data.get(i);
			int size = 0;

			for (String header : header_list) {
				for (Object value : obj.keySet()) {
					if (((String) value).equals(header)) {
						row.createCell(size).setCellValue((String) obj.get(value));
					}
				}
				size++;

			}
		}
	}

	// 엑셀 파일 다운로드
	private Boolean saveExcelFile() throws FileNotFoundException, IOException {

		FileOutputStream fileOut;

		if (path != null) {
			fileOut = new FileOutputStream(path);
			workbook.write(fileOut);
			fileOut.close();
			workbook.close();
			return true;
		} else {
			return false;
		}

	}
}
