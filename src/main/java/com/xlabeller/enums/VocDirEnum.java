package com.xlabeller.enums;

public enum VocDirEnum {
    ANNOTATIONS("VOC/Annotations/"),
    IMAGE_SETS("VOC/ImageSets/"),
    IMAGE_SETS_MAIN("VOC/ImageSets/main/"),
    IMAGE_SETS_SEGMENTATION("VOC/ImageSets/Segmentation/"),
    JPEG_IMAGES("VOC/JPEGImages/"),
    SEGMENTATION_OBJECT("VOC/SegmentationObject/")
    ;
    private final String dirPath;

    VocDirEnum(String dirPath) {
        this.dirPath = dirPath;
    }

    public String getDirPath() { return dirPath; }


}
