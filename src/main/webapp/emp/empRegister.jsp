<%@page import="dbtest.EmpService"%>
<%@page import="dbtest.EmpDTO"%>
<%@page import="util.DateUtil"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신규직원 DB저장하기........</h1>
<%
//get방식은 URL주소창에 data가 넘어온다....이때 자동으로 Encoding된다.(한글:공백->%20)
//자바에서 읽으면 자동으로 decoding된다. (%20->공백)
//post방식은 요청문서의 body숨겨서 서버에 전달된다.( Encoding안됨..)
// 서버에서 그대로 읽으면 한글깨짐 
//post일때 반드시 Encoding설정후 읽는다. 
request.setCharacterEncoding("utf-8");
int empid = Integer.parseInt(request.getParameter("employee_id"));
System.out.println(empid);
int deptid = Integer.parseInt(request.getParameter("department_id"));
int mid = Integer.parseInt(request.getParameter("manager_id"));
double salary = Double.parseDouble(request.getParameter("salary"));
double commission = Double.parseDouble(request.getParameter("commission_pct"));
String email = request.getParameter("email");
String fname = request.getParameter("first_name");
String lname = request.getParameter("last_name");
String jobid = request.getParameter("job_id");
String phone = request.getParameter("phone_number");
Date hdate =  DateUtil.convertSqlDate( 
              DateUtil.convertDate(request.getParameter("hire_date")));
//builder().field이름(값).field이름(값).build()
EmpDTO emp = EmpDTO.builder()
             .employee_id(empid)
             .department_id(deptid)
             .manager_id(mid)
             .salary(salary)
             .commission_pct(commission)
             .email(email)
             .first_name(fname).last_name(lname)
             .job_id(jobid).phone_number(phone)
             .hire_date(hdate)
             .build();
EmpService eService = new EmpService();
eService.insertService(emp);
%>
<table>
 <tr>
   <th>직원번호</th>
   <td><%=empid %></td>
 </tr>
 <tr>
   <th>부서번호</th>
   <td><%=deptid %></td>
 </tr>
 
 <tr>
   <th>메니져</th>
   <td><%=mid %></td>
 </tr>
 <tr>
   <th>commission</th>
   <td><%=commission %></td>
 </tr>
 <tr>
   <th>email</th>
   <td><%=email %></td>
 </tr>
 <tr>
   <th>fname</th>
   <td><%=fname %></td>
 </tr>
 <tr>
   <th>lname</th>
   <td><%=lname %></td>
 </tr>
 <tr>
   <th>메니져</th>
   <td><%=mid %></td>
 </tr>
 <tr>
   <th>job</th>
   <td><%=jobid %></td>
 </tr>
 <tr>
   <th>phone</th>
   <td><%=phone %></td>
 </tr>
 <tr>
   <th>입사일</th>
   <td><%=hdate %></td>
 </tr>
</table>
</body>
</html>






