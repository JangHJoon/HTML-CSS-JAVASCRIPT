package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class modifyCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		
		
		String id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		String re = request.getParameter("u_re");
		String name = request.getParameter("u_name");
		String nick = request.getParameter("u_nick");
		
		if(id == null || pw == null || re == null || name == null || nick == null){
			System.out.println("param null");
			//error
		}
	
		
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("id");
		
		if(sessionId == null || !sessionId.equals(id)){
			//error
		}
		
		ServletContext application = session.getServletContext();
		
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		
		if(userList == null){
			System.out.println("userList null");
			// error
		}
		
		if(!userList.containsKey(id)){
			// error
		}
						
		if(!pw.equals(re)){
			request.setAttribute("user", userList.get(id));
			request.setAttribute("nextPage", "info.jsp?fail=pw");
		}
		
		
		User newUser = new User(id,pw,name,nick);
		
		userList.put(id, newUser);
		
		request.setAttribute("isRedirect", true);
		request.setAttribute("nextPage", "loginSuccess.jsp");
		
		
		
	}
	

}
