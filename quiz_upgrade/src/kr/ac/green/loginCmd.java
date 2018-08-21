package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class loginCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
	
		String id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		
		// �ӽ� ������ ���̽� 
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		if(userList == null){
			userList = new Hashtable<String, User>();
			application.setAttribute("userData", userList);
		}
		
		if(userList.containsKey(id)){
			if(userList.get(id).getPw().equals(pw)){
				//�α��� ����
				session.setAttribute("id", id);
				request.setAttribute("nextPage", "loginSuccess.jsp");				
			
			} else {
				// ��й�ȣ Ʋ��
				request.setAttribute("nextPage", "loginForm.jsp?fail=pw&id=" + id);
			}
			
		} else {
			// ���̵� ����
			request.setAttribute("nextPage", "loginForm.jsp?fail=id");
		}	
		//				
	}	
}
