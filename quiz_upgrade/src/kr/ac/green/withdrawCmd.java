package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class withdrawCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id == null){
			//error
		}
		
		/// �����ͺ��̽�
		ServletContext application = session.getServletContext();
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		
		if(userList == null){
			//error			
		}
		
		if(!userList.containsKey(id)){
			//error
		}
		
		if(userList.get(id).getPw().equals(pw)){
			//��й�ȣ ��ġ
			userList.remove(id);
			session.invalidate();
			request.setAttribute("isRedirect", true);
			request.setAttribute("nextPage", "loginForm.jsp");
			
		} else {
			request.setAttribute("user", userList.get(id));
			request.setAttribute("nextPage", "info.jsp?fail=pw");
			//��й�ȣ ����ġ			
		}
		
		
	
	
	}
}
