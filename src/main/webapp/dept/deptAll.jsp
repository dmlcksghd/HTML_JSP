<%@page import="dept.DeptDTO"%>
<%@page import="dept.DeptService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
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
		border: 1px, solid, #ddd;
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
    }
    #cups { 
    	margin: 0 auto; 
    	border: 1px solid grey;
    }
</style>
</head>
<body>
<div id="cups">
	<!-- HTML주석(HTML해석기가 해석을 하지 않기 
	상대경로 : 나의 문서를 기준
	절대경로 : http://localhost:9090이후 작성 / 부터 시작
			/a_HTMLProjects의 위치는 webapp폴더임
	-->
	
	<img alt="" src="../resources/images/bg3.jpg" width="200" height="100">
	<img alt="" src="/a_HTMLProjects/resources/images/bg3.jpg" width="200" height="100">
</div>
<h1>부서목록</h1>
<table>
<thead>
	<tr>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>지역번호</th>
		<th>매니저 아이디</th>
	</tr>
</thead>
<tbody>
<%
DeptService dService = new DeptService();
List<DeptDTO> deptlist = dService.selectAllService();
for(DeptDTO dept : deptlist) { 
%>
	<tr>
		<td><%= dept.getDepartment_id() %></td>
		<td><%= dept.getDepartment_name() %></td>
		<td><%= dept.getLocation_id() %></td>
		<td><%= dept.getManager_id() %></td>
	</tr>
<% } %>
</tbody>
</table>
</body>
</html>