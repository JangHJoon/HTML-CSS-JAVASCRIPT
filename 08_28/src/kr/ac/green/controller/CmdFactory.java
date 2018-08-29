package kr.ac.green.controller;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.cmd.DeleteCmd;
import kr.ac.green.cmd.GetAllCmd;
import kr.ac.green.cmd.ICmd;
import kr.ac.green.cmd.InsertCmd;
import kr.ac.green.cmd.NullCmd;

public class CmdFactory {
	private static Hashtable<String, ICmd> cmds = new Hashtable<String, ICmd>();
	
	public static void init(){
		cmds.put("list", new GetAllCmd());
		cmds.put("insert", new InsertCmd());
		cmds.put("goInput", new NullCmd());
		cmds.put("delete", new DeleteCmd());
		
	}
	
	public static String searchAndDo(HttpServletRequest request, String cmd){
		return cmds.get(cmd).action(request);
	}
}
