package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Map;
import java.util.Enumeration;

public final class viewParameter_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("utf-8");

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("<title>요청 파라미터 출력</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<b> request.getParameter() 메서드 사용</b>\r\n");
      out.write("\t<br> \r\n");
      out.write("\tname 파라미터 =\r\n");
      out.write("\t");
      out.print(request.getParameter("name"));
      out.write("<br> \r\n");
      out.write("\taddress 파라미터 =\r\n");
      out.write("\t");
      out.print(request.getParameter("address"));
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("\t<p>\r\n");
      out.write("\t\t<b> request.getParameterValues() 메서드 사용</b><br>\r\n");
      out.write("\t\t");

			String[] values = request.getParameterValues("pet");
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
		
      out.write("\r\n");
      out.write("\t\t");
      out.print(values[i]);
      out.write("\r\n");
      out.write("\t\t");

				}
			}
		
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t</p>\r\n");
      out.write("\t<p>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<b> request.getParameterNames() 메서드 사용</b><br>\r\n");
      out.write("\t\t");

			Enumeration paramEnum = request.getParameterNames();
			while(paramEnum.hasMoreElements()){
				String name = (String)paramEnum.nextElement();
				
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.print( name );
      out.write("\r\n");
      out.write("\t\t\t\t");

			}
			
			
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</p>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<p>\r\n");
      out.write("\t\t\t<b> request.getParameterMap() 메서드 사용</b><br>\r\n");
      out.write("\t\t");

			Map parameterMap = request.getParameterMap();
			String[] nameParam = (String[])parameterMap.get("name");
			if(nameParam != null){
				
      out.write("\r\n");
      out.write("\t\t\t\tname = ");
      out.print( nameParam[0] );
      out.write("\r\n");
      out.write("\t\t\t\t");

			}
			
      out.write("\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
