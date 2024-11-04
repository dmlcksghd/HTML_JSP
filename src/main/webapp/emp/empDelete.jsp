<%@page import="job.JobDTO"%>
<%@page import="job.JobService"%>
<%@page import="dbtest.EmpDTO"%>
<%@page import="dbtest.EmpService"%>
<%@page import="java.util.List"%>
<%@page import="dept.DeptDTO"%>
<%@page import="dept.DeptService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DeptService dService = new DeptService();
	List<DeptDTO> deptlist = dService.selectAllService();
	
	EmpService eService = new EmpService();
	List<EmpDTO> emplist = eService.selectAllService();
	
	JobService jService = new JobService();
	List<JobDTO> joblist = jService.selectAllService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>직원 삭제</h1>
<form action="empRegister.jsp" method="post">
	<label>직원번호:</label>
</form>

</body>
</html>