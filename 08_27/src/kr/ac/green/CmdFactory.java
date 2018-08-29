package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class CmdFactory {
	
	
	private static Hashtable<String, ICmd> list;
	
	private CmdFactory() {
		
	}
	
	
	public static void init(){
		list = new Hashtable<String, ICmd>();
		
		list.put("goModify", new GoModify());		
		list.put("modify", new ModifyCmd());
		list.put("delete", new DeleteCmd());
		list.put("insert", new InsertCmd());
//		list.put("search", new)
	
	
	}
	
	public static void getAndAction(HttpServletRequest request, String cmd){
		
		
		if(list.containsKey(cmd)){
			list.get(cmd).exec(request);
		} else {
			//error
		}
		
	}
	
	

}
