<%@page import="card.CardsDTO"%>
<%@page import="java.util.List"%>
<%@page import="card.CardsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>card title</title>
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
</head>
<body>
<h1>카드목록</h1>
<table>
<thead>
	<tr>
		<th>카드 아이디</th>
		<th>카드 번호</th>
		<th>고객 번호</th>
		<th>계좌 번호</th>
		<th>카드 타입</th>
		<th>수정 날짜</th>
		<th>만료 날짜</th>
		<th>카드 상태</th>
		<th>카드 한도</th>
		<th>핀번호</th>
	</tr>
</thead>
<tbody>
<%
CardsService cardService = new CardsService();
List<CardsDTO> cardlist = cardService.getAllCards();
for (CardsDTO card : cardlist) {
%>
	<tr>
		<td><%= card.getCardId() %></td>
		<td><%= card.getCardNumber()%></td>
		<td><%= card.getCustomerId()%></td>
		<td><%= card.getAccountId()%></td>
		<td><%= card.getCardType()%></td>
		<td><%= card.getIssuedDate()%></td>
		<td><%= card.getExpiryDate()%></td>
		<td><%= card.getStatus()%></td>
		<td><%= card.getLimitAmount()%></td>
		<td><%= card.getPin()%></td>
	</tr>
<%} %>
</tbody>
</table>
</body>
</html>