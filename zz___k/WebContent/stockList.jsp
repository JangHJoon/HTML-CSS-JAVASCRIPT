<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.green.kr.Stock" %>
<%@ page import="java.util.Vector" %>
<%
	Vector<Stock> list = (Vector<Stock>)request.getAttribute("result");
	if(list == null) {
		list = (Vector<Stock>)application.getAttribute("stockList");
	}	
%>

<form>
	<table id="s_tb" style="width:70%; margin-top:40px; ">
		<caption style="margin-bottom:25px;"> ◐ 재고 리스트 ◑ </caption>
		<thead>
			<tr>
				<th style="background:#000; color:#fff; padding: 6px 25px;">NO</th>
				<th style="background:#000; color:#fff; padding: 6px 45px;">Name</th>
				<th style="background:#000; color:#fff; padding: 6px 30px;">Sort</th>
				<th style="background:#000; color:#fff; padding: 6px 25px;">Amount</th>
				<th style="background:#000; color:#fff; padding: 6px 50px;">EXP</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<%= list==null? 0:list.size() %>row(s)
				</td>
			</tr>
		</tfoot>
		<tbody>
		<%
			if((list == null) || (list.size() == 0)) {	
		%>
			<tr>
				<td colspan="5" align="center">no data</td>
			</tr>
		<%
			} else {
				for(Stock s : list) {
		%>
			<tr>
				<td style="padding:5px 25px; border-bottom:1px solid #eaeaea;"><%= s.getNo() %></td>
				<td style="padding:5px 25px; border-bottom:1px solid #eaeaea;"><%= s.getName() %></td>
				<td style="padding:5px 25px; border-bottom:1px solid #eaeaea;"><%= s.getSort() %></td>
				<td style="padding:5px 25px; border-bottom:1px solid #eaeaea;"><%= s.getAmount() %></td>
				<td style="padding:5px 25px; border-bottom:1px solid #eaeaea;"><%= s.getExp() %></td>
			</tr>
		<%
				}
			}
		%>	
		</tbody>
	</table>
</form>
