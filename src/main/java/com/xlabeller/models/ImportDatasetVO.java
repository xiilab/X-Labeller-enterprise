package com.xlabeller.models;

import org.springframework.web.multipart.MultipartFile;

public class ImportDatasetVO {
	
	private String id;
	private String title;
	private String contents;
	private String created_date;
	private MultipartFile[] files;
	private String user_id;
	private String is_enable;
	private String is_new;
	private String label_type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getIs_enable() {
		return is_enable;
	}
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	public String getIs_new() {
		return is_new;
	}
	public void setIs_new(String is_new) {
		this.is_new = is_new;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	
}
