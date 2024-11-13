<%@page import="dbtest.JobDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dbtest.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dbtest.EmpService"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>

* {
   font-family: "Nanum Gothic", sans-serif !important;
   font-weight: 400;
   font-style: normal;
}
table {
  caption-side: top;
}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

th {
	background-color: orange;
}
/* tag이름 사이의 공백은 자손을 의미 
even == 2n
odd == 2n+1 
*/
tbody tr:nth-child(even){
  background-color: lightgray;
} 
/*  email의 칼럼에 대하여 글씨색을 변경 */
tbody tr:nth-child(n) > td:nth-child(5){
   color: red;
}
/*firstName이 'S'로 시작하는 직원들 선택 style적용    */
tbody td:nth-child(2)[data-fname^='S']{
  color: purple;
}

tbody td:nth-child(3)[data-lname$='n']{
  color: purple;
}
/* tbody td:nth-child(7)[data-job='IT_PROG']{
  color: yellow;
} */
tbody td:nth-child(8),
tbody td:nth-child(9) {
  text-align: right;
}
 
caption {
	font-family: "Nanum Pen Script", cursive!important;
	font-weight: bold;
	font-size: 2em;
}
#container{
  width: 1000px;
  margin: 0 auto;
}
span {
	color: red;
}
a.new { 
display: block; 
padding: 20px; 
/* position: relative;
top : 50px;
left: 50px;
float: left;
text-decoration: none;
background-color: blue;
color: white;
margin: 10px;
border-radius: 20px; */
}
header{
  width: 100%;
  text-align: center;
}

td:nth-child(9){
  background-color: pink; 
}
.red { color: red; font-weight: bold; }
.blue { color: blue;}
</style>
<script>
 window.onload = function(){	 
	 var obj = document.querySelector("#btn_search");
	 var obj_job = document.querySelector("#btn_search_job");	 
	 obj.onclick = f_salary;  //이벤트속성에 이벤트핸들러 연결 
	 obj_job.onclick = f_job;  //이벤트속성에 이벤트핸들러 연결
 };
 function f_job(){
	 //var job = document.querySelector("#input_job").value;
	 var job = document.querySelector("[name='job_id']").value;
	 
	 var tds = document.querySelectorAll("td:nth-child(7)");	 
	 for(let i=0; i<tds.length ;i++){
		 //<td class="red">IT_PROG</td>
		 var job2 = tds[i].innerText;		 
		 if(job == job2){
			 tds[i].setAttribute("class","red"); 
		 } else{
			 tds[i].setAttribute("class", "blue");
		 }
	 }
 }
 
 function f_salary(){
	 var sal = parseInt(document.querySelector("#input_sal").value);
	 var tds = document.querySelectorAll("td:nth-child(9)");	 
	 for(let i=0; i<tds.length ;i++){
		 //<td class="red">200000</td>
		 var sal2 = parseInt(tds[i].innerText);		 
		 if(sal <= sal2){
			 tds[i].setAttribute("class","red"); 
		 } else{
			 tds[i].setAttribute("class", "blue");
		 }
	 }
 }
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>다음의 목록은 <span>직원정보</span>입니다. </h1>
		</header>
		<main>
		    <section>
		       <button class="btn btn-primary">조회</button>
		       <button class="btn btn-success">수정</button>
		       <a class="btn btn-info" href="empInsert.jsp">신규직원등록</a>
			   <a class="btn btn-danger" href="../dept/deptInsert.jsp">신규부서등록</a>
			   <input type="number" id="input_sal" value="10000">
			   <button id="btn_search" class="btn btn-success">금액으로찾기</button>
			   <input type="text" id="input_job" value="IT_PROG">
			   <select  name="job_id" class="required">
				   <% 
				   EmpService eService = new EmpService();
				   List<JobDTO> joblist = eService.selectAllJobService();
				   for(JobDTO job:joblist){ %>
				      <option value="<%=job.getJob_id() %>"><%=job.getJob_title() %></option>
				   <% }%>
			  </select>
				
			   <button id="btn_search_job" class="btn btn-success">Job찾기</button>
		    </section>
			<section>
				<div>
					<table>
						<caption>직원목록</caption>
						<thead>
							<tr>
								<th>직원번호</th>
								<th>firstName</th>
								<th>lastName</th>
								<th>dept</th>
								<th>email</th>
								<th>phone</th>
								<th>job_id</th>
								<th>comm</th>
								<th>salary</th>
								<th>입사일</th>
								<th>manager</th>
							</tr>
						</thead>
						<tbody>
							<%
							
							List<EmpDTO> emplist = eService.selectAllService();
							for (EmpDTO emp : emplist) {
							%>
							<tr>
								<td>
								  <a href="empDetail.jsp?empid=<%=emp.getEmployee_id()%>">
								       <%=emp.getEmployee_id()%>
								  </a> 
								
								</td>
								<td data-fname="<%=emp.getFirst_name()%>">
								     <%=emp.getFirst_name()%>
								</td>
								<td data-lname="<%=emp.getLast_name()%>">
								   <%=emp.getLast_name()%>
								</td>
								<td><%=emp.getDepartment_id()%></td>
								<td><%=emp.getEmail()%></td>
								<td><%=emp.getPhone_number()%></td>
								<td data-job="<%=emp.getJob_id()%>">
								     <%=emp.getJob_id()%>
								</td>
								<td><%=emp.getCommission_pct()%></td>
								<td><%=emp.getSalary()%></td>
								<td><%=emp.getHire_date()%></td>
								<td><%=emp.getManager_id()%></td>
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






