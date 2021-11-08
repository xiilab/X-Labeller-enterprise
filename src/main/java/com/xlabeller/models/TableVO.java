package com.xlabeller.models;

public class TableVO {
	private String table_name;
	private String column_name;
	private String afterColName;
	private String beforeColName;
	private String type;
	private String default_value;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getDefault_value() {
		return default_value;
	}
	public void setDefault_value(String default_value) {
		this.default_value = default_value;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	public String getAfterColName() {
		return afterColName;
	}
	public String getBeforeColName() {
		return beforeColName;
	}
	public void setBeforeColName(String beforeColName) {
		this.beforeColName = beforeColName;
	}
	public void setAfterColName(String afterColName) {
		this.afterColName = afterColName;
	}
	
	
}
