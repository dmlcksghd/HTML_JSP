<%@page import="dbtest.EmpService"%>
<%@page import="dbtest.EmpDTO"%>
<%@page import="job.JobDTO"%>
<%@page import="util.DateUtil"%>
<%@page import="java.sql.Date"%>
<%@page import="util.DBUtil"%>
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
	// get방식은 URL주소창에 data가 넘어온다...이때 자동으로 Encoding된다.(한글:공백->%20)
	// 자바에서 읽으면 자동으로 decoding된다.(%20->공백)
	// post방식은 요청문서의 body숨겨서 서버에 전달된다.(Encoding안됨..)
	// 서버에서 그대로 읽으면 한글 깨짐
	// post일 때 만드시 Encoding설정 후 읽는다.
	
	java.util.Date utilDate = new java.util.Date(); // java.util.Date 생성
	Date sqlDate = new Date(utilDate.getTime()); // java.sql.Date로 변환
	
	request.setCharacterEncoding("utf-8");
	int empid = Integer.parseInt(request.getParameter("employee_id"));
	int deptid = Integer.parseInt(request.getParameter("department_id"));
	int mid = Integer.parseInt(request.getParameter("manager_id"));
	double salary = Double.parseDouble(request.getParameter("salary"));
	double commission = Double.parseDouble(request.getParameter("commission_pct"));
	String email = request.getParameter("email");
	String fname = request.getParameter("first_name");
	String lname = request.getParameter("last_name");
	String jobid = request.getParameter("job_id");
	String phone = request.getParameter("phone_number");
	Date hdate = DateUtil.convertSqlDate(DateUtil.convertDate(request.getParameter("hire_date"))); 
// builder().field이름(값).field이름(값)~.build();
EmpDTO emp = EmpDTO.builder()
			.employee_id(empid)
			.department_id(deptid)
			.manager_id(mid)
			.salary(salary)
			.commission_pct(commission)
			.email(email)
			.first_name(fname).last_name(lname)
			.job_id(jobid)
			.phone_number(phone)
			//.hire_date(sqlDate)
			.hire_date(hdate)
			.build();

EmpService eService = new EmpService();
eService.insertService(emp);
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
	<td>이름</td>
	<td><%=fname %></td>
	</tr>
	<tr>
	<td>성</td>
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