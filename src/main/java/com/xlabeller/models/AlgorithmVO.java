package com.xlabeller.models;

import org.springframework.web.multipart.MultipartFile;

public class AlgorithmVO {	
	private String algorithm_id;
	private String title;
	private String description;
	private String docker_cmd;
	private String dataset_id;
	
	private String train_param;
	private String inference_param;
	private String created_date;
	private String user_id;
	private String is_enable;
	private String is_fixed;
	private String base_image;
	private String train_func_name;
	private String load_func_name;
	private String inference_func_name;
	
	
	private MultipartFile upload_file;

	private String page_num;
	private String page_size;
	private String total_size;
	private String label_type;
	
	
	
	
	public String getDocker_cmd() {
		return docker_cmd;
	}
	public void setDocker_cmd(String docker_cmd) {
		this.docker_cmd = docker_cmd;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
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
	public String getAlgorithm_id() {
		return algorithm_id;
	}
	public void setAlgorithm_id(String algorithm_id) {
		this.algorithm_id = algorithm_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getTrain_param() {
		return train_param;
	}
	public void setTrain_param(String train_param) {
		this.train_param = train_param;
	}
	public String getInference_param() {
		return inference_param;
	}
	public void setInference_param(String inference_param) {
		this.inference_param = inference_param;
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
	public String getIs_enable() {
		return is_enable;
	}
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	public String getIs_fixed() {
		return is_fixed;
	}
	public void setIs_fixed(String is_fixed) {
		this.is_fixed = is_fixed;
	}
	public String getBase_image() {
		return base_image;
	}
	public void setBase_image(String base_image) {
		this.base_image = base_image;
	}
	public String getTrain_func_name() {
		return train_func_name;
	}
	public void setTrain_func_name(String train_func_name) {
		this.train_func_name = train_func_name;
	}
	public String getLoad_func_name() {
		return load_func_name;
	}
	public void setLoad_func_name(String load_func_name) {
		this.load_func_name = load_func_name;
	}
	public String getInference_func_name() {
		return inference_func_name;
	}
	public void setInference_func_name(String inference_func_name) {
		this.inference_func_name = inference_func_name;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	public String getDataset_id() {
		return dataset_id;
	}
	public void setDataset_id(String dataset_id) {
		this.dataset_id = dataset_id;
	}
	
	
	
	
	
	
	
	
}
/*
CREATE TABLE `ALGORITHM` (
  `ALGORITHM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `ENV` varchar(1000) DEFAULT NULL,
  `PIP_INSTALL` varchar(1000) DEFAULT NULL,
  `APT_INSTALL` varchar(1000) DEFAULT NULL,
  `TRAIN_PARAM` varchar(1000) DEFAULT NULL,
  `INFERENCE_PARAM` varchar(1000) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IS_ENABLE` int(11) DEFAULT NULL,
  `IS_FIXED` int(11) DEFAULT NULL,
  `BASE_IMAGE` varchar(200) DEFAULT NULL,
  `TRAIN_FUNC_NAME` varchar(200) DEFAULT NULL,
  `LOAD_FUNC_NAME` varchar(200) DEFAULT NULL,
  `INFERENCE_FUNC_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ALGORITHM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


ALGORITHM_ID
TITLE
DESCRIPTION
ENV
PIP_INSTALL
APT_INSTALL
TRAIN_PARAM
INFERENCE_PARAM
CREATED_DATE
USER_ID
IS_ENABLE
IS_FIXED
BASE_IMAGE
TRAIN_FUNC_NAME
LOAD_FUNC_NAME
INFERENCE_FUNC_NAME

algorithm_id
title
description
env
pip_install
apt_install
train_param
inference_param
created_date
user_id
is_enable
is_fixed
base_image
train_func_name
load_func_name
inference_func_name


*/