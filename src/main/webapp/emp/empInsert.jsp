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
	label {
		display: inline-block;
		width: 100px;	/* width속성은 inline에서 사용불가, block요소에서만 가능 */
	}
	#contaner {
		width: 70%;
		border: 1px dotted gray;
		margin: 0 auto;
	}
</style>
</head>
<body>
<div id="contaner">
	<h1>직원등록</h1>
	<form action="empRegister.jsp" method="post">
		<label>직원번호:</label><input type="number" name="employee_id"><br>
		
		<label>부서번호:</label>
		<select name="department_id">
			<!-- <option value="100">개발부</option> -->
			<%
				for (DeptDTO dept: deptlist) {
			%>
				<option value="<%=dept.getDepartment_id() %>">
					<%=dept.getDepartment_name() %>
				</option>
			<%} %>
		</select>
		
		<br>
		<label>상사번호:</label>
		<select name="manager_id">
			<%
				for (EmpDTO emp : emplist) {
			%>
				<option value="<%=emp.getManager_id() %>">
					<%=emp.getFirst_name() %> <%= emp.getLast_name() %>
				</option>
			
			<%} %>
		</select>
		<!-- <input type="number" name="manager_id"> -->
		
		<br>
		<label>급여:</label><input type="number" name="salary"><br>
		<label>커미션:</label><input type="text" name="commission_pct"><br>
		<label>이메일:</label><input type="text" name="email"><br>
		<label>fname:</label><input type="text" name="first_name"><br>
		<label>lname:</label><input type="text" name="last_name"><br>
		
		<label>직업 아이디:</label>
		<select name="job_id">
		<%
			for (JobDTO job : joblist) {
		%>
			<option value="<%=job.getJob_id()%>">
				<%=job.getJob_title()%>
			</option>
		<%} %>
		</select>
		<!-- <input type="text" name="job_id" value="IT_PROG"> -->
		
		<br>
		<label>전화번호:</label><input type="text" name="phone_number"><br>
		<label>입사일:</label><input type="date" name="hire_date"><br>
		<input type="submit" value="직원저장">
	</form>
</div>

</body>
</html>