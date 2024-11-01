<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("userid");
String uname = request.getParameter("username");
%>

<p>당신의 아이디는 <%= uid %></p>
<p>당신의 이름은 <%= uname %></p>
</body>
</html>