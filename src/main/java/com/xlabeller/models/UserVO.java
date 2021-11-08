package com.xlabeller.models;
 
public class UserVO {
	
	private String  user_id   ;
    private String  account   ;
    private String  password   ;
    private String  created_date   ;
    private String level_cd;
    
    private String x_key;
    private String login_count;
    
    
    
    

	public String getX_key() {
		return x_key;
	}
	public void setX_key(String x_key) {
		this.x_key = x_key;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	public String getLevel_cd() {
		return level_cd;
	}
	public void setLevel_cd(String level_cd) {
		this.level_cd = level_cd;
	}
	public String getLogin_count() {
		return login_count;
	}
	public void setLogin_count(String login_count) {
		this.login_count = login_count;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
    
    
    
    
    
   
	
	
}


/*


ID
ACCOUNT
PASSWORD
CREATED_DATE
NAME
EMAIL
USAGE_PURPOSE
ORGANIZATION
DEPARTMENT
CERTIFICATION
PATH

id
account
password
created_date
name
email
usage_purpose
organization
department
certification
path

*/

