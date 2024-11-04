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
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
}

#container {
	width: 100%;
	max-width: 500px;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
}

h1 {
	text-align: center;
	font-size: 1.8em;
	margin-bottom: 20px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="number"], input[type="date"], select {
	width: 100%;
	padding: 10px;
	font-size: 1em;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 12px;
	background-color: #4CAF50;
	color: white;
	font-size: 1em;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	margin-top: 20px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.link {
	text-align: center;
	margin-bottom: 20px;
}

.link a {
	color: #333;
	text-decoration: none;
	font-size: 0.9em;
}

.link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div id="contaner">
		<a href="empAll.jsp">직원조회</a>
		<h1>직원등록</h1>
		<form action="empRegister.jsp" method="post">
			<label>직원번호:</label><input type="number" name="employee_id"><br>

			<label>부서번호:</label> <select name="department_id">
				<!-- <option value="100">개발부</option> -->
				<%
				for (DeptDTO dept : deptlist) {
				%>
				<option value="<%=dept.getDepartment_id()%>">
					<%=dept.getDepartment_name()%>
				</option>
				<%
				}
				%>
			</select> <br> <label>상사번호:</label> <select name="manager_id">
				<%
				for (EmpDTO emp : emplist) {
				%>
				<option value="<%=emp.getManager_id()%>">
					<%=emp.getFirst_name()%>
					<%=emp.getLast_name()%>
				</option>

				<%
				}
				%>
			</select>
			<!-- <input type="number" name="manager_id"> -->

			<br> <label>급여:</label><input type="number" name="salary"><br>
			<label>커미션:</label><input type="text" name="commission_pct"><br>
			<label>이메일:</label><input type="text" name="email"><br>
			<label>fname:</label><input type="text" name="first_name"><br>
			<label>lname:</label><input type="text" name="last_name"><br>

			<label>직업 아이디:</label> <select name="job_id">
				<%
				for (JobDTO job : joblist) {
				%>
				<option value="<%=job.getJob_id()%>">
					<%=job.getJob_title()%>
				</option>
				<%
				}
				%>
			</select>
			<!-- <input type="text" name="job_id" value="IT_PROG"> -->

			<br> <label>전화번호:</label><input type="text" name="phone_number"><br>
			<label>입사일:</label><input type="date" name="hire_date"><br>
			<input type="submit" value="직원저장">
		</form>
	</div>

</body>
</html>