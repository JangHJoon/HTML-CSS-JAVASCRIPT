package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

// Command Pattern : ���ø����̼��� ������ ĸ��ȭ�Ͽ� �����Ѵ�.
public interface ICmd {
	void doAction(HttpServletRequest request);
}
