package com.xlabeller.enums;

public enum VocDirEnum {
    ANNOTATIONS("VOC/ANNOTATIONS/"),
    IMAGE_SETS("VOC/IMAGESETS/"),
    IMAGE_SETS_MAIN("VOC/IMAGESETS/MAIN/"),
    IMAGE_SETS_SEGMENTATION("VOC/IMAGESETS/SEGMENTATION/"),
    JPEG_IMAGES("VOC/JPEGIMAGES/"),
    SEGMENTATION_OBJECT("VOC/SEGMENTATIONOBJECT/")
    ;
    private final String dirPath;

    VocDirEnum(String dirPath) {
        this.dirPath = dirPath;
    }

    public String getDirPath() { return dirPath; }


}
