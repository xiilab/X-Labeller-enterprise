package com.xlabeller.common.module;

import org.apache.log4j.Logger;

import java.io.*;

public class TextReader {

	private String filePath;
	
	private static Logger logger = Logger.getLogger(TextReader.class);
	public TextReader(String filePath) {
		this.filePath = filePath;
	}
	
	
	public String getRandomAccess(int start,int size) {
		File file = null;
		RandomAccessFile raf = null;
		String result = null;
		byte[] b = null;
		try {
			file = new File(filePath);

			int fileLen = 0;
			if (file.exists()) {
				fileLen = (int) file.length();
			} else {
				return "";
			}

			if (fileLen > start + size) {
			} else {
				size = fileLen - start;
			}

			if (size <= 0) {
				size = 0;
			}
			
			raf = new RandomAccessFile(filePath, "r");
			b = new byte[size];
			raf.seek(start);
			raf.read(b);
			result = new String(b);
			
		} catch (IOException e) {
			logger.error("IOException Error!", e);
		} finally {
			file = null;
			try {
				if(raf != null) {
					raf.close();
					raf = null;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error("IOException Error!", e);
			}
			b = null;
		}
//		raf.close();
		return result;

	}
	

	// 파일 byte 사이즈 가져옴
	public int getFileLength() throws FileNotFoundException, IOException {
		File file = getFile();

		if (file.exists()) {
			// 파일이 존재할때
			byte[] b = new byte[(int) file.length()];
			return b.length;
		} else {
			// 파일이 존재하지 않을떄
			return -1;
		}
	}

	private File getFile() {
		return new File(filePath);

	}

	// 바이트 사이즈에 의해 글자가져옴
	public String getTextByByte(int start, int size) throws FileNotFoundException, IOException {

		File file = getFile();
		byte[] b = new byte[(int) file.length()];

		int startPos = start;
		int sizePos = size + start;
		int endPos = getFileLength();

		if (!file.exists() || endPos == -1) {
			return "파일이 존재하지 않습니다";
		}

		FileInputStream input = new FileInputStream(file);
		input.read(b);

		if (sizePos > endPos) {
			sizePos = endPos;
		}

		if (startPos > endPos) {
			return "데이터가 존재하지 않습니다";
		}

		byte[] temp_byte = new byte[b.length];
		int temp_size = 0;

		// 새로운 temp_byte 에 현재 시작과 끝에 따라서 데이터 넣음
		for (int i = startPos; i < sizePos; i++) {
			temp_byte[temp_size] = b[i];
			temp_size++;
		}

		input.close();
		b = null;

		// byte 를 string 으로 변경해서 리턴
		return new String(temp_byte);

	}

}
