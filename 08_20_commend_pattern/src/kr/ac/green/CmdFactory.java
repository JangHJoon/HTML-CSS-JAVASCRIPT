package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class CmdFactory {
	private static Hashtable<String, ICmd> cmds;
	
	public static void initCmds() {
		cmds = new Hashtable<String, ICmd>();
				
		cmds.put("/list.do", new ListCmd());
		cmds.put("/cancelInput.do", new ListCmd());
		cmds.put("/goInput.do", new GoInputCmd());
		cmds.put("/input.do", new InputCmd());	
		
	}
	
	public static void searchAndDo(
		HttpServletRequest request, String cmd) {
		ICmd cmdObj = cmds.get(cmd);
		if(cmdObj == null) {
			cmdObj = new BadAccessCmd();
		} 
		cmdObj.doAction(request);		
	}
}











