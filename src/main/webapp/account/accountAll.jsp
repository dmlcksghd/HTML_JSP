<%@page import="account.AccountsDTO"%>
<%@page import="java.util.List"%>
<%@page import="account.AccountsService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account title</title>
</head>
<body>
<h1>계좌목록</h1>
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
</style>
<table>
<thead>
	<tr>
		<th>계좌 번호</th>
		<th>고객 아이디</th>
		<th>계좌 종류</th>
		<th>잔고</th>
		<th>생성일자</th>
		<th>계좌 상태</th>
	</tr>
</thead>
<tbody>
<%
AccountsService accountService = new AccountsService();
List<AccountsDTO> accountlist = accountService.getAllaccounts();
for (AccountsDTO account : accountlist) {
%>
	<tr>
		<td><%= account.getAccountId() %></td>
		<td><%= account.getCustomerId() %></td>
		<td><%= account.getAccountType() %></td>
		<td><%= account.getBalance() %></td>
		<td><%= account.getCreatedAt() %></td>
		<td><%= account.getStatus() %></td>
	</tr>
<%} %>
</tbody>
</table>
</body>
</html>