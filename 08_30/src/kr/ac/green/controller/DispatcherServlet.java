package kr.ac.green.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import kr.ac.green.dao.DaoFactory;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		//WEB-INF 폴더안 properties 파일 읽기
		String path = config.getInitParameter("cmdsInfoPath");
		ServletContext application = config.getServletContext();
		String realPath = application.getRealPath(path);
		
		
		
		File file = new File(realPath);
		long time = file.lastModified();
		application.setAttribute("time", time);
		application.setAttribute("realPath", realPath);
		
		Properties prop = new Properties();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(realPath);
			
			prop.load(fis);
		} catch(IOException e){
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		
		String db = config.getInitParameter("db");
		DaoFactory.init(db);	
		
		
		CmdFactory.init(prop);
		super.init(config);
		
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = request.getSession().getServletContext();
		
		long time = (long) application.getAttribute("time");
		File f = new File(application.getAttribute("realPath").toString());
		
		long newTime = f.lastModified();
		
		if(time != newTime){
			// properties 파일이 변경됬어요 
			// 다시 로드해서 수정하세요!
		}
		
		
		
		
		
		
		
		String cmd = request.getRequestURI().substring(
			request.getContextPath().length()
		);		
		request.setAttribute("cmd", cmd);
		String nextPage = CmdFactory.searchAndDo(request, cmd);
		
		if(request.getAttribute("isRedirect") != null) {
			response.sendRedirect(nextPage);
		} else {
			request.getRequestDispatcher(nextPage)
			.forward(request, response);
		}
	}
}











