package com.xlabeller.common.module;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.*;

public class NIOFileCopy {
	//j.seo 추가
	public boolean nioFileCopy(String inFileName, String outFileName) {
		Path source = Paths.get(inFileName);
		Path target = Paths.get(outFileName);

		// 사전체크
		if (source == null) {
			throw new IllegalArgumentException("There is no checkpoint file.");
		}
		if (target == null) {
			throw new IllegalArgumentException("There is no targetFile file.");
		}

		// 소스파일이 실제로 존재하는지 체크
		if (!Files.exists(source, new LinkOption[] {})) {
			throw new IllegalArgumentException("Source file doesn't exist: "
					+ source.toString());
		}

		
		try {
			Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING); // 파일복사

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		if (Files.exists(target, new LinkOption[] {})) { // 파일이 정상적으로 생성이 되었다면
			System.out.println("File Complete.");
			return true; // true 리턴
		} else {
			System.out.println("File Copy Failed");
			return false; // 실패시 false
		}
	}
	
    public void allFileCopy(File sourceF, File targetF){
	File[] target_file = sourceF.listFiles();
	for (File file : target_file) {
		File temp = new File(targetF.getAbsolutePath() + File.separator + file.getName());
		if(file.isDirectory()){
			temp.mkdir();
			allFileCopy(file, temp);
		} else {
			FileInputStream fis = null;
			FileOutputStream fos = null;
			try {
				fis = new FileInputStream(file);
				fos = new FileOutputStream(temp) ;
				byte[] b = new byte[4096];
				int cnt = 0;
				while((cnt=fis.read(b)) != -1){
					fos.write(b, 0, cnt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				try {
					fis.close();
					fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
		}
	  }	
    }

}
