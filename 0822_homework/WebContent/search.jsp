<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<form id="searchForm">
�˻�: <select>
  <option value="id">ID</option>
  <option value="name">Name</option>
  <option value="class">Class</option>
</select>
����: <input type="text" name="search" />
<input type="button" value="go" onlick="search()" />
</form>