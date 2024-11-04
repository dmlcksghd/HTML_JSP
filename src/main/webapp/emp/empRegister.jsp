<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신규직원 DB저장하기</h1>
<%
	String empid = request.getParameter("employee_id");
	String deptid = request.getParameter("department_id");
	String mid = request.getParameter("manager_id");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission_pct");
	String email = request.getParameter("email");
	String fname = request.getParameter("first_name");
	String lname = request.getParameter("last_name");
	String jobid = request.getParameter("job_id");
	String phone = request.getParameter("phone_number");
	String hdate = request.getParameter("hire_date");
%>
<table>
	<tr>
	<td>직원번호</td>
	<td><%=empid %></td>
	</tr>
	<tr>
	<td>부서번호</td>
	<td><%=deptid %></td>
	</tr>
	<tr>
	<td>매니저 번호</td>
	<td><%=mid %></td>
	</tr>
	<tr>
	<td>급여</td>
	<td><%=salary %></td>
	</tr>
	<tr>
	<td>커미션</td>
	<td><%=commission %></td>
	</tr>
	<tr>
	<td>이메일</td>
	<td><%=email %></td>
	</tr>
	<tr>
	<td>fname</td>
	<td><%=fname %></td>
	</tr>
	<tr>
	<td>lname</td>
	<td><%=lname %></td>
	</tr>
	<tr>
	<td>직업 번호</td>
	<td><%=jobid %></td>
	</tr>
	<tr>
	<td>phone</td>
	<td><%=phone %></td>
	</tr>
	<tr>
	<td>입사일</td>
	<td><%=hdate %></td>
	</tr>
</table>
</body>
</html>