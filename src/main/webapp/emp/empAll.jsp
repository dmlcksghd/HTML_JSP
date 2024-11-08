<%@page import="dbtest.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dbtest.EmpService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style>
/* 스타일 */
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

th {
	background-color: rgb(255, 163, 138);
}

tbody tr:nth-child(2n) {
	background-color: #f9f9f9;
}

tbody tr:nth-child(2n+1) {
	background-color: #e0e0e0;
}

.red {
	color: red;
}

caption {
	font-family: "Nanum Pen Script", "맑음고딕";
	font-weight: 400;
	font-size: 2em;
}

#container {
	width: 800px;
	margin: 0 auto;
}

span {
	color: red;
}

a.new {
	display: block;
	padding: 10px;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
<script>
	window.onload = function() {
		var obj = document.querySelector("#btn-search");
		var obj_job = document.querySelector("#btn_search_job");
		obj.onclick = f_salary;
		obj_job.onclick = f_job;
	};
	function f_salary() {
		var sal = document.querySelector("#input_sal").value;
		var tds = document.querySelectorAll("tbody td:nth-child(8)");
		for (let i = 0; i < tds.length; i++) {
			var sal2 = parseInt(tds[i].innerText);
			if (sal <= sal2) {
				tds[i].classList.add("red");
			} else {
				tds[i].classList.remove("red");
			}
		}
	}
	function f_job() {
		var job = document.querySelector("#input_job").value;
		var tds = document.querySelectorAll("tbody td:nth-child(7)");
		for (let i = 0; i < tds.length; i++) {
			var job2 = tds[i].innerText;
			if (job === job2) {
				tds[i].classList.add("red");
			} else {
				tds[i].classList.remove("red");
			}
		}
	}
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>
				다음의 목록은 <span>직원정보</span>입니다.
			</h1>
		</header>
		<main>
			<section>
				<button class="btn btn-primary">조회</button>
				<button class="btn btn-primary">수정</button>
			</section>
			<section>
				<div>
					<a class="new" href="empInsert.jsp">신규직원등록</a> <a class="new"
						href="../dept/deptInsert.jsp">신규부서등록</a> 
					<input type="number" id="input_sal" value="10000">
					<button id="btn-search" class="btn btn-success">금액으로 찾기</button>
					<input type="text" id="input_job" value="IT_PROG">
					<button id="btn_search_job" class="btn btn-success">Job찾기</button>
					<h1>직원목록</h1>
					<table>
						<caption>직원번호</caption>
						<thead>
							<tr>
								<th>직원번호</th>
								<th>firstName</th>
								<th>lastName</th>
								<th>email</th>
								<th>phone</th>
								<th>입사일</th>
								<th>jobId</th>
								<th>salary</th>
								<th>commission</th>
								<th>mngID</th>
								<th>deptID</th>
							</tr>
						</thead>
						<tbody>
							<%
							EmpService eService = new EmpService();
							List<EmpDTO> emplist = eService.selectAllService();
							for (EmpDTO emp : emplist) {
							%>
							<tr>
								<td><%=emp.getEmployee_id()%></td>
								<td data-fname="<%=emp.getFirst_name()%>"><%=emp.getFirst_name()%></td>
								<td><%=emp.getLast_name()%></td>
								<td><%=emp.getEmail()%></td>
								<td><%=emp.getPhone_number()%></td>
								<td><%=emp.getHire_date()%></td>
								<td><%=emp.getJob_id()%></td>
								<td><%=emp.getSalary()%></td>
								<td><%=emp.getCommission_pct()%></td>
								<td><%=emp.getManager_id()%></td>
								<td><%=emp.getDepartment_id()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</section>
		</main>
	</div>
</body>
</html>
