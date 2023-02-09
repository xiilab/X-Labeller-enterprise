package com.xlabeller.common.module;

import com.xlabeller.common.exception.HandlerCustomException;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtil {
    private ByteArrayOutputStream baos = null;
    private ZipOutputStream zip = null;

    public ZipUtil() {
        this.baos = new ByteArrayOutputStream();
        this.zip = new ZipOutputStream(this.baos);
    }

    public void putEntry(String fileName, byte[] bytes) {
        ZipEntry jsonEntry = new ZipEntry(fileName);
        jsonEntry.setSize(bytes.length);
        try {
            zip.putNextEntry(jsonEntry);
            zip.write(bytes);
            zip.closeEntry();
        } catch (IOException e) {
            throw new HandlerCustomException("500", "압축 파일을 다운로드 받던 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
    }

    public byte[] getZipOutputStream() {
        return this.baos.toByteArray();
    }

    public void close() {
        try {
            this.zip.close();
        } catch (IOException e) {
            throw new HandlerCustomException("500", "압축 파일을 다운로드 받던 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
    }
}
