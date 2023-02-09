package com.xlabeller.models;

import java.util.List;

public class MetaVO {
	
	private String meta_id;
	private String data_id;
	private String user_id;
	private String task_id;
	private String label_type;
	private String label;
	private String info;
//	private String crop_img;
	private String path;
	private String fps;
	private String frame;
	
	
	private String stay_flag;
	private String dataset_id;
	private String dataset_ids;
	private String data;
	
	private String page_num;
	private String page_size;
	private String total_size;
	private List<MetaVO> meta_list;
//	private String segmentation;
	
	
	
	
	public String getDataset_id() {
		return dataset_id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public void setDataset_id(String dataset_id) {
		this.dataset_id = dataset_id;
	}
	public String getStay_flag() {
		return stay_flag;
	}
	public void setStay_flag(String stay_flag) {
		this.stay_flag = stay_flag;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getData_id() {
		return data_id;
	}
	public void setData_id(String data_id) {
		this.data_id = data_id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getMeta_id() {
		return meta_id;
	}
	public void setMeta_id(String meta_id) {
		this.meta_id = meta_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	public String getFps() {
		return fps;
	}
	public void setFps(String fps) {
		this.fps = fps;
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
	public String getDataset_ids() {
		return dataset_ids;
	}
	public void setDataset_ids(String dataset_ids) {
		this.dataset_ids = dataset_ids;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getFrame() {
		return frame;
	}
	public void setFrame(String frame) {
		this.frame = frame;
	}

	public List<MetaVO> getMeta_list() {
		return meta_list;
	}

	public void setMeta_list(List<MetaVO> meta_list) {
		this.meta_list = meta_list;
	}
}
	
	

