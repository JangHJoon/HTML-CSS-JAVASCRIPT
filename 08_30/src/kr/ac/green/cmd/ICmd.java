package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICmd {
	String action(HttpServletRequest request, HttpServletResponse response);
}
