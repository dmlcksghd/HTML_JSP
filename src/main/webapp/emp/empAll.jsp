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
<style>
    body {
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
    }
</style>
</head>
<body>
<h1>직원목록</h1>
<table>
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
for(EmpDTO emp : emplist) { %>
    <tr>
        <td><%= emp.getEmployee_id() %></td>
        <td><%= emp.getFirst_name() %></td>
        <td><%= emp.getLast_name() %></td>
        <td><%= emp.getEmail() %></td>
        <td><%= emp.getPhone_number() %></td>
        <td><%= emp.getHire_date() %></td>
        <td><%= emp.getJob_id() %></td>
        <td><%= emp.getSalary() %></td>
        <td><%= emp.getCommission_pct() %></td>
        <td><%= emp.getManager_id() %></td>
        <td><%= emp.getDepartment_id() %></td>
    </tr>
<% } %>
</tbody>
</table>
</body>
</html>
