package com.xlabeller.models;

public class AnnotationVO {
	
	private String annotation_id;
	private String title;
	private String contents;
	private String created_date;
	private String data;
	private String user_id;
	private String page_num;
	private String page_size;
	private String total_size;
	private String label_type;
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
	public String getAnnotation_id() {
		return annotation_id;
	}
	public void setAnnotation_id(String annotation_id) {
		this.annotation_id = annotation_id;
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
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}

}
	