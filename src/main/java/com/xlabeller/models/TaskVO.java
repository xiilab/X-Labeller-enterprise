package com.xlabeller.models;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TaskVO {
	private String task_id;
	//private String id;
	private String project_id;
	private String title;
	private String contents;
	private String created_date;
	private String user_id;
	private String algorithm;

	private String config;
	private String is_enable;
	private String is_fixed;

	private List<String> annotation_list;

	private String algorithm_id;
	
	
	private String gpu_node_id;
	private String gpu_index;
	
	
	
	private String type;
	
	
	
	private String annotation_id;
	
	private String page_num;
	private String page_size;
	private String total_size;
	private String base_task_id;
	private String check_point_name;
	private String csv_save_name;
	private String label_type;
	private String model_name;
	private String path;
	private String annotation_title;
	private String task_title;
	private String dataset_id;
	private String csv_title;
	private String address;

//	private String mapPath1;
//	private String mapPath2;
	private List<String> mapPath;
	private MultipartFile[] files;
	
	
	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGpu_node_id() {
		return gpu_node_id;
	}
	public void setGpu_node_id(String gpu_node_id) {
		this.gpu_node_id = gpu_node_id;
	}
	public String getGpu_index() {
		return gpu_index;
	}
	public void setGpu_index(String gpu_index) {
		this.gpu_index = gpu_index;
	}
	public String getIs_fixed() {
		return is_fixed;
	}
	public void setIs_fixed(String is_fixed) {
		this.is_fixed = is_fixed;
	}
	public String getAlgorithm_id() {
		return algorithm_id;
	}
	public void setAlgorithm_id(String algorithm_id) {
		this.algorithm_id = algorithm_id;
	}
	public List<String> getAnnotation_list() {
		return annotation_list;
	}
	public void setAnnotation_list(List<String> annotation_list) {
		this.annotation_list = annotation_list;
	}
	public String getAnnotation_id() {
		return annotation_id;
	}
	public void setAnnotation_id(String annotation_id) {
		this.annotation_id = annotation_id;
	}
	
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAlgorithm() {
		return algorithm;
	}
	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}
	
	public String getConfig() {
		return config;
	}
	public void setConfig(String config) {
		this.config = config;
	}
	public String getIs_enable() {
		return is_enable;
	}
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	public String getPage_num() {
		return page_num;
	}
	public void setPage_num(String page_num) {
		this.page_num = page_num;
	}
	public String getPage_size() {
		return page_size;
	}
	public void setPage_size(String page_size) {
		this.page_size = page_size;
	}
	public String getTotal_size() {
		return total_size;
	}
	public void setTotal_size(String total_size) {
		this.total_size = total_size;
	}
	public String getBase_task_id() {
		return base_task_id;
	}
	public void setBase_task_id(String base_task_id) {
		this.base_task_id = base_task_id;
	}
	public String getCheck_point_name() {
		return check_point_name;
	}
	public void setCheck_point_name(String check_point_namse) {
		this.check_point_name = check_point_namse;
	}
	public String getCsv_save_name() {
		return csv_save_name;
	}
	public void setCsv_save_name(String csv_save_name) {
		this.csv_save_name = csv_save_name;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
//	public String getMapPath1() {
//		return mapPath1;
//	}
//	public void setMapPath1(String mapPath1) {
//		this.mapPath1 = mapPath1;
//	}
//	public String getMapPath2() {
//		return mapPath2;
//	}
//	public void setMapPath2(String mapPath2) {
//		this.mapPath2 = mapPath2;
//	}
	public List<String> getMapPath() {
		return mapPath;
	}
	public void setMapPath(List<String> mapPath) {
		this.mapPath = mapPath;
	}
	public String getAnnotation_title() {
		return annotation_title;
	}
	public void setAnnotation_title(String annotation_title) {
		this.annotation_title = annotation_title;
	}
	public String getTask_title() {
		return task_title;
	}
	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}
	public String getDataset_id() {
		return dataset_id;
	}
	public void setDataset_id(String dataset_id) {
		this.dataset_id = dataset_id;
	}
	public String getCsv_title() {
		return csv_title;
	}
	public void setCsv_title(String csv_title) {
		this.csv_title = csv_title;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
/*

ID
PROJECT_ID
TITLE
CONTENTS
CREATED_DATE
USER_ID
ALGORITHM
BACKBONE
CONFIG
IS_ENABLE

id
project_id
title
contents
created_date
user_id
algorithm
backbone
config
is_enable

*/