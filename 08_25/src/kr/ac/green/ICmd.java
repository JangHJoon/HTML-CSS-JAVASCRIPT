package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public interface ICmd {
	void exec(HttpServletRequest request);
}
