package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;


public class CmdFactory {
	
	private static Hashtable<String, ICmd> cmdList;
	
	public static void init(){
		
		cmdList = new Hashtable<String, ICmd>();
		cmdList.put("goInput", new GoInputCmd());
		
				
	}
	
	public static void searchAndDo(HttpServletRequest request, String cmd){
		
		if(cmdList.containsKey(cmd)){
			cmdList.get(cmd).todo(request);
			
		} else {
			// 잘못된 접근 404
		}
	}

}
