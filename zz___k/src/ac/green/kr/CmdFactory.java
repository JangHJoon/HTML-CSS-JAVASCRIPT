package ac.green.kr;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class CmdFactory {
	private static Hashtable<String, ICmd> cmds;
	
	public static void initCmds() {
		cmds = new Hashtable<String, ICmd>();
		
		cmds.put("/list.do", new ListCmd());
		cmds.put("/insert.do", new InsertCmd());
		cmds.put("/goInsert.do", new GoInsertCmd());
		cmds.put("/goModify.do", new GoModifyCmd());
		cmds.put("/goDelete.do",  new GoDeleteCmd());
		cmds.put("/search.do", new SearchCmd());
		cmds.put("/modify.do", new ModifyCmd());
		cmds.put("/delete.do", new DeleteCmd());
	}
	
	public static void searchAndDo(HttpServletRequest request, String cmd) {
		ICmd cmdObj = cmds.get(cmd);
		if(cmdObj == null) {
			cmdObj = new BadAccessCmd();
		}
		cmdObj.doAction(request);
	}
}
