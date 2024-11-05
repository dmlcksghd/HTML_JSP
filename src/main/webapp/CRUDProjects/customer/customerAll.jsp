<%@page import="CRUDProjects.customer.CustomerDTO"%>
<%@page import="java.util.List"%>
<%@page import="CRUDProjects.customer.CustomerService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 목록</title>
</head>
<body>
<h1>고객목록</h1>
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
		<th>고객 번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>주소</th>
		<th>등록 날짜</th>
	</tr>
</thead>
<tbody>
<%
CustomerService customerService = new CustomerService();
List<CustomerDTO> customerlist = customerService.getAllCustomers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

if (customerlist != null && !customerlist.isEmpty()) {
	for (CustomerDTO customer : customerlist) {
%>
	<tr>
		<td><%= customer.getCustomerId() %></td>
		<td><%= customer.getFullName() %></td>
		<td><%= customer.getPhoneNumber() %></td>
		<td><%= customer.getEmail() %></td>
		<td><%= customer.getAddress() %></td>
		<td><%= customer.getUpdatedAt() != null ? sdf.format(customer.getUpdatedAt()) : "N/A" %></td>
	</tr>
<%
	}
} else {
%>
	<tr>
		<td colspan="6">고객 데이터가 없습니다.</td>
	</tr>
<%
}
%>
</tbody>
</table>
</body>
</html>
