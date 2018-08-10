package kr.ac.green;

public class GuestMessage {


	
	private String ip;
	private String msg;
	
	public GuestMessage (String ip, String msg){
		this.ip = ip;
		this.msg = msg;
	}

	public String getIp() {
		return ip;
	}

	public String getMsg() {
		return msg;
	}
	


}
