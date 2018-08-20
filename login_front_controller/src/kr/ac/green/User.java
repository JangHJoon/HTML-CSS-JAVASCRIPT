package kr.ac.green;

public class User {
	private String uid;
	private String upw;
	private String nick;
	
	public User() {
		
	}
	public User(String uid, String upw, String nick) {
		
		this.uid = uid;
		this.upw = upw;
		this.nick = nick;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Override
	public boolean equals(Object o){
		if(o == null || !(o instanceof User)) {
			return false;
		}
		if(this == o) {
			return true;
		}
		User other = (User)o;
		return uid.equals(other.getUid());
	}
	
}