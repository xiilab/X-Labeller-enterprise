package com.xlabeller.common.exception;

public class HandlerCustomException extends RuntimeException{
    private String code;
    private String message;
    private Throwable throwable;
    public HandlerCustomException(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public HandlerCustomException(String code, String message, Throwable throwable) {
        this.code = code;
        this.message = message;
        this.throwable = throwable;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Throwable getThrowable() {
        return throwable;
    }

    public void setThrowable(Throwable throwable) {
        this.throwable = throwable;
    }
}
