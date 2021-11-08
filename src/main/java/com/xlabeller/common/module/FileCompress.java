package com.xlabeller.common.module;

import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileCompress{
	public ZipOutputStream zos;
	
    public FileCompress(OutputStream os) throws Exception{
    	zos = new ZipOutputStream(os); 
    }
    
    public void append(String fileName, byte[] raw) throws Exception {
    	ZipEntry ze = new ZipEntry(fileName);
        zos.putNextEntry(ze);
        zos.write(raw);
        zos.closeEntry();
    }
    
    
    public void mkdir(String fileName) throws Exception {
    	ZipEntry ze = new ZipEntry(fileName);
        zos.putNextEntry(ze);
        zos.closeEntry();
    }
    
    public void close() throws Exception {
    	zos.close();
    }
}