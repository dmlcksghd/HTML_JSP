<%@page import="dbtest.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dbtest.EmpService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style>
/* body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        margin-top: 20px;
    }
    h1 {
        color: #333;
    }
    table {
        width: 80%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    table, th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #e0e0e0;
    } */
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

/* 태그이름 사이의 공백은 자손을 의미 */
tbody tr:nth-child(2n) {
	background-color: #f9f9f9;
}

tbody tr:nth-child(2n+1) {
	background-color: #e0e0e0;
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
</style>
</head>
<body>
	<div id="container">
		<header>
			<h1>다음의 목록은 <span>직원정보</span>입니다.</h1>
		</header>
		<main>
			<section>
				<div>
					<a href="empInsert.jsp">신규직원등록</a>
					<h1>직원목록</h1>
					<table>
						<thead>
							<tr>
								<caption>직원번호</caption>
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
								<td><%=emp.getFirst_name()%></td>
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
