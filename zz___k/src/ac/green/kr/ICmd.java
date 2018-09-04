package ac.green.kr;

import javax.servlet.http.HttpServletRequest;

public interface ICmd {
	void doAction(HttpServletRequest request);
}
