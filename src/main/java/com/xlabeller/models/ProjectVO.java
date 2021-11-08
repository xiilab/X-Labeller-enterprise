package com.xlabeller.models;

public class ProjectVO {
	
	private String project_id;
	private String title;
	private String contents;
	private String created_date;
	private String solution_type;
	
	private String user_id;
	
	
	private String page_num;
	private String page_size;
	private String total_size;
	
	private String is_fixed;
	
	
	
	
	
	
	
	public String getIs_fixed() {
		return is_fixed;
	}
	public void setIs_fixed(String is_fixed) {
		this.is_fixed = is_fixed;
	}
	public String getSolution_type() {
		return solution_type;
	}
	public void setSolution_type(String solution_type) {
		this.solution_type = solution_type;
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