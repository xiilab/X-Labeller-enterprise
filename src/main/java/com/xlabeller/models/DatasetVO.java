package com.xlabeller.models;

import org.springframework.web.multipart.MultipartFile;

public class DatasetVO {
	
	private String dataset_id;
	private String title;
	private String contents;
	private String created_date;
	private MultipartFile[] files;
	private String user_id;
	private String media_type;
	private String label_type;
	private String status;
	private String save_data_id;
	private String dataset_ids;
	
	private String page_num;
	private String page_size;
	private String total_size;

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
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getSave_data_id() {
		return save_data_id;
	}
	public void setSave_data_id(String save_data_id) {
		this.save_data_id = save_data_id;
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
	public String getMedia_type() {
		return media_type;
	}
	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDataset_ids() {
		return dataset_ids;
	}
	public void setDataset_ids(String dataset_ids) {
		this.dataset_ids = dataset_ids;
	}
	
	
	
	
	
	
	
	
}
	
/*	
id
title
contents
created_date
point
type
status


ID
TITLE
CONTENTS
CREATED_DATE
POINT
TYPE
STATUS
*/