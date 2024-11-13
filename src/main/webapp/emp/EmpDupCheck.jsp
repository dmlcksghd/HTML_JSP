<%@page import="dbtest.EmpDTO"%>
<%@page import="dbtest.EmpService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여기는 자바가 해석하는 공간이다.
String str_empid = request.getParameter("empid");
int i_empid = Integer.parseInt(str_empid);
EmpService eService = new EmpService();
EmpDTO emp = eService.selectByIdService(i_empid);
String result = "OK";
if(emp!=null){
	result = "NO";
} 
%>
<%=result %>