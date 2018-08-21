package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class joinCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {

		String id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		String re = request.getParameter("u_re");
		String name = request.getParameter("u_name");
		String nick = request.getParameter("u_nick");
		
		// 데이터베이스
		ServletContext application = request.getSession().getServletContext();
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		if(userList == null){
			userList = new Hashtable<String, User>();
			application.setAttribute("userData", userList);
		}
		
		if(userList.containsKey(id)){
			request.setAttribute("nextPage", "join.jsp?fail=id");
			
		} else {
			//serverdata를 수정하므로 redirect가 필요하다.
			userList.put(id, new User(id,pw,name,nick));
			request.setAttribute("nextPage", "loginForm.jsp?id=" + id);
			request.setAttribute("isRedirect", true);
		}	
		
		
		//
		
	}
}
