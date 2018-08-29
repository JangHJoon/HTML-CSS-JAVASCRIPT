package kr.ac.green.controller;

import java.util.Hashtable;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.cmd.ICmd;



public class CmdFactory {
	private static Hashtable<String, ICmd> cmds = new Hashtable<String, ICmd>();
	
	public static void init(Properties prop) {
		
		Set<?> keys = prop.keySet();
		
		for(Object temp : keys){
			
			String key = temp.toString();
			String className = prop.getProperty(key);
			
			try {
				
				Class klass = Class.forName(className);
				ICmd cmdObj = (ICmd) klass.newInstance();
				
				cmds.put(key, cmdObj);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
			/*
			 * 
			 * servlet과 cmdfactory는 고정된다. ==> 프레임 워크 
			 * 
			 * 
			 * 
			 */
			
			
		}
		
		
		
		
		
//		cmds.put("/list.html", new GetAllCmd());
//		cmds.put("/insert.html", new InsertCmd());
//		cmds.put("/goInput.html", new NullCmd());
//		cmds.put("/showDummy.html", new ShowDummyCmd());
//		cmds.put("/delete.html", new DeleteCmd());
	}
	
	public static String searchAndDo(
		HttpServletRequest request, String cmd) {
		
		return cmds.get(cmd).action(request);		
	}
}

















