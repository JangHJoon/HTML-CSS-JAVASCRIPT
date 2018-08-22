package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;


public class CmdFactory {
	
	private static Hashtable<String, ICmd> cmdList;
	
	public static void init(){
		
		cmdList = new Hashtable<String, ICmd>();
		cmdList.put("goInsert", new GoInsertCmd());
		cmdList.put("goList", new GoListCmd());
		cmdList.put("goModify", new GoModifyCmd());
		cmdList.put("goDelete", new GoDeleteCmd());
		
		cmdList.put("insert", new InsertCmd());
		cmdList.put("search", new SearchCmd());
		cmdList.put("modify", new ModifyCmd());
		cmdList.put("delete", new DeleteCmd());
		
		
		
				
	}
	
	public static void searchAndDo(HttpServletRequest request, String cmd){
		
		if(cmdList.containsKey(cmd)){
			cmdList.get(cmd).todo(request);
			
		} else {
			// 잘못된 접근 404
		}
	}

}
