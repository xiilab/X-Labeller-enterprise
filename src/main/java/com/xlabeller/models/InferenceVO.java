package com.xlabeller.models;

public class InferenceVO {
	

	private String id;
	private String task_id;
	private String model_name;
//	private String score;
	private String img_path;
//	private String is_convert_model;
	private String csv_save_name;
	private String dataset_id;
	
	

	private String gpu_node_id;
	private String gpu_index;
	
	private String config;
	private String quick; 
	
	
	
	
	
	
	public String getConfig() {
		return config;
	}
	public void setConfig(String config) {
		this.config = config;
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
	
	public String getCsv_save_name() {
		return csv_save_name;
	}
	public void setCsv_save_name(String csv_save_name) {
		this.csv_save_name = csv_save_name;
	}
	
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getQuick() {
		return quick;
	}
	public void setQuick(String quick) {
		this.quick = quick;
	}
	public String getDataset_id() {
		return dataset_id;
	}
	public void setDataset_id(String dataset_id) {
		this.dataset_id = dataset_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}
