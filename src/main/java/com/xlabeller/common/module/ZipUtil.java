package com.xlabeller.common.module;

import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.imExport.ImExportService;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtil {
    //private ByteArrayOutputStream baos = null;
    private static Logger logger = Logger.getLogger(ZipUtil.class);
    private FileOutputStream fos = null;
    private ZipOutputStream zip = null;
    private String filePath = null;

    public ZipUtil(String filePath) throws FileNotFoundException {
        this.filePath = filePath;
        this.fos = new FileOutputStream(filePath);
        this.zip = new ZipOutputStream(this.fos);
    }

    public void putDirectoryEntry(String dirName) {
        ZipEntry dirEntry = new ZipEntry(dirName);
        try {
            zip.putNextEntry(dirEntry);
            zip.closeEntry();
        } catch (IOException e) {
            throw new HandlerCustomException("500", "압축 파일을 다운로드 받던 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.", e);
        }
    }
    public void putEntry(String fileName, byte[] bytes) {
        ZipEntry entry = new ZipEntry(fileName);
        entry.setSize(bytes.length);
        try {
            zip.putNextEntry(entry);
            zip.write(bytes);
            zip.closeEntry();
        } catch (IOException e) {
            throw new HandlerCustomException("500", "압축 파일을 다운로드 받던 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.", e);
        }
    }

//    public byte[] getZipOutputStream() {
//        return this.baos.toByteArray();
//    }
    public byte[] getZipOutputStream()  {
        InputStream in = null;
        try {
            in = new FileInputStream(this.filePath);
            return IOUtils.toByteArray(in);
        } catch (IOException e) {
            logger.error("IOException Error!", e);
            throw new HandlerCustomException("500", "ZIP파일을 export하는 과정에서 오류가 발생했습니다.");
        }

    }

    public void close() {
        try {
            this.zip.close();
        } catch (IOException e) {
            throw new HandlerCustomException("500", "압축 파일을 다운로드 받던 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.", e);
        }
    }
}
