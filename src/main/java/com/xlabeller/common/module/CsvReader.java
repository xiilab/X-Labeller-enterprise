package com.xlabeller.common.module;

import com.xlabeller.models.InferenceResultVO;
import com.xlabeller.models.LossMapVO;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class CsvReader {
	private String path;
	private static Logger logger = Logger.getLogger(CsvReader.class);

	public CsvReader(String path) {
		this.path = path;
	}

	public List<InferenceResultVO> read() {
		List<InferenceResultVO> result = new ArrayList<InferenceResultVO>();
		Reader reader = null;
		CSVParser csvParser = null; 
		try {
			reader = Files.newBufferedReader(Paths.get(this.path));
			csvParser = new CSVParser(reader, CSVFormat.DEFAULT);
			for (CSVRecord csvRecord : csvParser) {
//            	if(!(csvRecord.size() == 6 || csvRecord.size() == 3)) {
//            		return null;
//            	}
				if (csvRecord.size() == 6) {
					InferenceResultVO irVO = new InferenceResultVO();
					irVO.setImg_path(csvRecord.get(0));
					irVO.setX(csvRecord.get(1));
					irVO.setY(csvRecord.get(2));
					irVO.setW(csvRecord.get(3));
					irVO.setH(csvRecord.get(4));
					irVO.setLabel(csvRecord.get(5));
					result.add(irVO);
				} else if (csvRecord.size() == 3) {
					JSONArray jArray = new JSONArray();
					String point = csvRecord.get(1);
					point = point.replace("(", "");
					String[] point_array = point.split("\\),");
					point_array[point_array.length - 1] = point_array[point_array.length - 1].replace(")", "");
					// x,y 최소, 최대값
					int x1 = 0;
					int y1 = 0;
					int x2 = 0;
					int y2 = 0;
					int w = 0;
					int h = 0;

					for (int i = 0; i < point_array.length; i++) {
						String[] cursor = point_array[i].split(",");
						float float_x = 0;
						float float_y = 0;
						try {
							// float_x = Float.valueOf(cursor[0]);
							// float_y = Float.valueOf(cursor[1]);
							if (!StringUtils.hasText(cursor[0]) || !StringUtils.hasText(cursor[1])) {
								continue;
							}
							float_x = (float) (Math.floor(Float.parseFloat(cursor[0]) * 10) / 10);
							float_y = (float) (Math.floor(Float.parseFloat(cursor[1]) * 10) / 10);
						} catch (NumberFormatException e) {
							// TODO: handle exception
							logger.error("Float 형변환 중 오류발생!", e);
							return null;
						}

						//String json = "{x: " + float_x + ", y: " + float_y + "}";
						JSONObject json = new JSONObject();
						json.put("x", float_x);
						json.put("y", float_y);
						jArray.add(json);
						int temp_x = (int) float_x;
						int temp_y = (int) float_y;

						if (i == 0) {
							x1 = temp_x;
							y1 = temp_y;
							x2 = temp_x;
							y2 = temp_y;
						}

						if (temp_x < x1) {
							x1 = temp_x;
						}
						if (temp_y < y1) {
							y1 = temp_y;
						}
						if (x2 < temp_x) {
							x2 = temp_x;
						}
						if (y2 < temp_y) {
							y2 = temp_y;
						}

					}

					w = x2 - x1;
					h = y2 - y1;
					String segmentation = jArray.toJSONString().replace("\"", "");
					InferenceResultVO irVO = new InferenceResultVO();
					irVO.setImg_path(csvRecord.get(0));
					irVO.setX(String.valueOf(x1));
					irVO.setY(String.valueOf(y1));
					irVO.setW(String.valueOf(x2));
					irVO.setH(String.valueOf(y2));
					irVO.setLabel(csvRecord.get(2));
					irVO.setSegmentation(segmentation);
					result.add(irVO);
				} else {
					return null;
				}
			}

//			csvParser.close();
//			reader.close();
			return result;
		} catch (Exception e) {
			if (e instanceof IOException) {
				logger.error("IOException!", e);
				return null;
		 	 } else {
		 		logger.error("Exception!", e);
		 		return null; 
		 	 }
			//return null;
		} finally {
			try {
				if(csvParser != null) {
					csvParser.close();
				} 
				if(reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				logger.error("IOEXception Error!", e);
			}
		}

	}

	// j.seo추가
//	public List<LossMapVO> lossCSVRead() {
//		List<LossMapVO> result = new ArrayList<LossMapVO>(); 
//		try {
//            Reader reader = Files.newBufferedReader(Paths.get(this.path));
//            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT);
//            for (CSVRecord csvRecord : csvParser) {
//            	LossMapVO lmVO = new LossMapVO(); 
//            	lmVO.setEpoch(csvRecord.get(0));
//            	lmVO.setBatch(csvRecord.get(1));
//            	lmVO.setLoss(csvRecord.get(2));
//        		result.add(lmVO);
//        	}     
//            csvParser.close();
//            reader.close();
//            return result;
//		}catch (IOException e) {
//            return null;
//        }
//	}

	public List<LossMapVO> mapCSVRead() {
		List<LossMapVO> result = new ArrayList<LossMapVO>();
		Reader reader = null;
		CSVParser csvParser = null;
		try {
			reader = Files.newBufferedReader(Paths.get(this.path));
			csvParser = new CSVParser(reader, CSVFormat.DEFAULT);
			for (CSVRecord csvRecord : csvParser) {
				LossMapVO lmVO = new LossMapVO();
				lmVO.setEpoch(csvRecord.get(0));
				lmVO.setMap(csvRecord.get(1));
				result.add(lmVO);
			}
			return result;
		} catch (IOException e) {
			logger.error("IOException Error!", e);
			return null;
		} finally {
			try {
				if (csvParser != null) {
					csvParser.close();
					csvParser = null;
				}
				if (reader != null) {
					reader.close();
					reader = null;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error("IOException Error!", e);
			}
		}
	}

	public List<String> readToArray() {
		List<String> result = new ArrayList<String>();
		Reader reader = null;
		CSVParser csvParser = null;
		try {
			reader = Files.newBufferedReader(Paths.get(this.path));
			csvParser = new CSVParser(reader, CSVFormat.DEFAULT);
			for (CSVRecord csvRecord : csvParser) {
				if (csvRecord == null || csvRecord.size() <= 0) {
					result.clear();
					result = null;
					return result;
				}
				
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < csvRecord.size(); i++) {
					if (i == 0) {
						sb.append(csvRecord.get(i));
					} else {
						sb.append(",");
						sb.append(csvRecord.get(i));
					}
				}
				result.add(sb.toString());
			}

			return result;
		} catch (IOException e) {
			logger.error("IOException Error!", e);
			return null;
		} finally {
			try {
				if (csvParser != null) {
					csvParser.close();
					csvParser = null;
				}
				if (reader != null) {
					reader.close();
					reader = null;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error("IOException Error!", e);
			}
		}

	}
}
