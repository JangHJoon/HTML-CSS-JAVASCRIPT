package kr.ac.green;

import java.io.Serializable;

public class UserData implements Serializable{
	
	private String u_id;
	private String u_pw;
	private String u_name;
	
	@Override
	public String toString() {
		return "UserData [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_nick=" + u_nick + "]";
	}
	private String u_nick;
	
	
	public UserData(String id, String pw, String name, String nick) {
		super();
		this.u_id = id;
		this.u_pw = pw;
		this.u_name = name;
		this.u_nick = nick;
	}
	
	public String getId() {
		return u_id;
	}
	public void setId(String id) {
		this.u_id = id;
	}
	public String getPw() {
		return u_pw;
	}
	public void setPw(String pw) {
		this.u_pw = pw;
	}
	public String getName() {
		return u_name;
	}
	public void setName(String name) {
		this.u_name = name;
	}
	public String getNick() {
		return u_nick;
	}
	public void setNick(String nick) {
		this.u_nick = nick;
	}

	
	
}
