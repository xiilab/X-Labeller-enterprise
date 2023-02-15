package com.xlabeller.enums;

public enum VisualLabelResultTypeEnum {
    SIZE("SIZE"),
    CENTER_POSITION("CENTER_POSITION")
    ;

    private final String resultType;

    VisualLabelResultTypeEnum(String resultType) {
        this.resultType = resultType;
    }

    public String getResultType() { return resultType; }
}
