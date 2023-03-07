package com.xlabeller.enums;

public enum PathEnum {
    NFS_MOUNT_ROOT_PATH("/xlabeller"),
    WORKSPACE_PATH("/usr/local/uploadFile"),
    IMPORT_VOC_TEMP_PATH("/usr/local/uploadFile/xlabeller/dataset_temp")
    ;

    private final String path;

    PathEnum(String path) {this.path = path;}

    public String getPath() {
        return path;
    }
}
