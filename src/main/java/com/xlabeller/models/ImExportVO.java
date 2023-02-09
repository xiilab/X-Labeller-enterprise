package com.xlabeller.models;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;
import org.vertx.java.core.http.impl.SwitchingHttpResponseDecoder;

@Getter
@Setter
public class ImExportVO {
    String dataset_ids;
    Integer dataset_id;
    Integer data_id;
    Integer width;
    Integer height;
    String filename;
    Integer meta_id;
    String label;
    String info;
    String path;
    String label_type;
    MultipartFile import_zip_file;
    String title;
    String contents;
    MultipartFile[] files;
    String media_type;

}
