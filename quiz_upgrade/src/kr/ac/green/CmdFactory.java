package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;


public class CmdFactory {
	
	private static Hashtable<String, ICmd> cmdList;
	
	public static void init(){
		
		cmdList = new Hashtable<String, ICmd>();
		
		cmdList.put("goJoin",new GoJoinCmd());
		cmdList.put("goLogin",new goLoginCmd());
		cmdList.put("login", new loginCmd());
		cmdList.put("join", new joinCmd());
		cmdList.put("goInfo", new goInfoCmd());
		cmdList.put("logout", new logoutCmd());
		cmdList.put("goSuccess", new goLoginSuccessCmd());
		cmdList.put("withdraw", new withdrawCmd());
		cmdList.put("modify", new modifyCmd());
		
				
	}
	
	public static void searchAndDo(HttpServletRequest request, String cmd){
		
		if(cmdList.containsKey(cmd)){
			cmdList.get(cmd).todo(request);
			
		} else {
			// 잘못된 접근 404
		}
	}

}
