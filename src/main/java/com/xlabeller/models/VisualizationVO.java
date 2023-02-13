package com.xlabeller.models;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VisualizationVO {
    private String dataset_id;
    private String hd_data_cnt;
    private String fhd_data_cnt;
    private String qhd_data_cnt;
    private String fk_data_cnt;
    private String class_cnt;
    private String hd_meta_cnt;
    private String fhd_meta_cnt;
    private String qhd_meta_cnt;
    private String fk_meta_cnt;
    private String label;
}
