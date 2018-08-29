package kr.ac.green.dto;


public class Post {
	
	private int    p_id;
	private String p_ip;
	private String p_password;
	private String p_title;
	private String p_content;
	private String p_date;
	
	public Post() {
	}
	
	public Post(String p_ip, String p_password, String p_title,
			String p_content) {
		this.p_ip = p_ip;
		this.p_password = p_password;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_date = p_date;
	}
	
	public Post(int p_id, String p_ip, String p_password, String p_title,
			String p_content, String p_date) {
		this.p_id = p_id;
		this.p_ip = p_ip;
		this.p_password = p_password;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_date = p_date;
	}
	
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_ip() {
		return p_ip;
	}
	public void setP_ip(String p_ip) {
		this.p_ip = p_ip;
	}
	public String getP_password() {
		return p_password;
	}
	public void setP_password(String p_password) {
		this.p_password = p_password;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	
	

}
