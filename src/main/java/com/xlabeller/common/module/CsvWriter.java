package com.xlabeller.common.module;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;



public class CsvWriter {

	

	private JSONArray data;
	private String path;
	private String[] header_list;
	private static Logger logger = Logger.getLogger(CsvWriter.class);
	
	public CsvWriter() {
		
	}
	public CsvWriter(JSONArray data, String[] header_list, String path) {
		this.header_list = header_list;
		this.path = path;
		this.data = data; 
	}

	private ArrayList<ArrayList<String>> parse() {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		for(int i = 0 ; i < data.size(); i++) {
			ArrayList<String> tempList = new ArrayList<String>();
			JSONObject tempObj = (JSONObject)data.get(i);
			for(int j = 0 ; j < header_list.length ; j++) {
				tempList.add((String)tempObj.get(header_list[j]));
			}
			result.add(tempList);
		}
		return result;
		
		
	}
	public boolean create() {
		
        
		CSVPrinter csvPrinter = null;
		ArrayList<ArrayList<String>> recordList = parse();
        
		BufferedWriter writer = null;
		try {
			writer = Files.newBufferedWriter(Paths.get(path));
			csvPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT);
			for(int i = 0 ; i < recordList.size(); i++) {
				csvPrinter.printRecord(recordList.get(i));
			}
			csvPrinter.flush();
			
			csvPrinter.close();
			writer.close();
			
			return true;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error("IOException Error!", e);
			return false;
		}finally {
			writer = null;
			try {
				if(csvPrinter != null) {
					csvPrinter.close();
					csvPrinter = null;
				}
			} catch (IOException e) {	
				logger.error("IOException Error!", e);
				csvPrinter = null;
			}
		}
 
	    
	}

	public boolean createString(String path, String imgPath) {
//		try (PrintWriter writer = new PrintWriter(new File(path))) {
//	
//			StringBuilder sb = new StringBuilder();
//			sb.append(imgPath);
//
//			writer.write(sb.toString());
//			return true;
//
//		} catch (FileNotFoundException e) {
//			System.out.println(e.getMessage());
//			return false;
//		} finally {
//			
//		}
		
		PrintWriter writer = null;
		StringBuilder sb = null;
		try {
			
			writer = new PrintWriter(new File(path));
			sb = new StringBuilder();
			sb.append(imgPath);

			writer.write(sb.toString());
			return true;

		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
			return false;
		} finally {
			if(writer != null) {
				writer.close();
				writer = null;
			}
		}

	}

}
