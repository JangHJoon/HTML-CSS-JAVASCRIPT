package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

// Command Pattern : 어플리케이션의 로직을 캡슐화하여 관리한다.
public interface ICmd {
	void doAction(HttpServletRequest request);
}
