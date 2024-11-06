<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CRUDProjects.customer.CustomerService"%>
<%@page import="CRUDProjects.customer.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>특정고객 조회 목록</h1>
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
			CustomerDTO customer = customerService.getCustomerById(customerId, fullName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			%>
			<tr>
				<td><%=customer.getCustomerId()%></td>
				<td><%=customer.getFullName()%></td>
				<td><%=customer.getPhoneNumber()%></td>
				<td><%=customer.getEmail()%></td>
				<td><%=customer.getAddress()%></td>
				<td><%=customer.getUpdatedAt() != null ? sdf.format(customer.getUpdatedAt()) : "N/A"%></td>
			</tr>
			<%
			
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