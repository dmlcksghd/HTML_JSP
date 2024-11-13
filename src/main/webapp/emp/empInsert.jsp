<%@page import="dbtest.JobDTO"%>
<%@page import="dbtest.EmpDTO"%>
<%@page import="dbtest.EmpService"%>
<%@page import="dept.DeptDTO"%>
<%@page import="java.util.List"%>
<%@page import="dept.DeptService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
DeptService dService = new DeptService();
List<DeptDTO> deptlist = dService.selectAllService();

EmpService empService = new EmpService();
List<EmpDTO> emplist = empService.selectAllService();
List<JobDTO> joblist = empService.selectAllJobService();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  label {
      background-color: teal;
      color: white;
      text-align:center;
      padding: 5px;
      margin-bottom:5px;
      display:inline-block;
	  width: 100px; /* width속성은 inline에서 사용불가, block요소에서만 가능*/
  }
  #container{
     width: 70%;
     border: 1px dotted gray;
     margin: 0 auto;
  }
  input, select {
     width: 200px;
     box-sizing: border-box;
     padding: 5px;
      margin-bottom:5px;
  }
  
  /*
  .required {
     border: 3px dotted red;
  }*/
  
  input[class="required"], select[class="required"]{
   border: 3px dotted blue;
  }
  input[type="submit"]{
     background-color: orange;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
  var isDupCheck = false;
  $(()=>{
	  $("#myfrm").on("submit", f_submit);
  });
  function f_submit(event){
	  var empobj = $('input[name="employee_id"]');
	  var empid = $(empobj).val();
	  if(empid >= 100){
		  alert("신규 직원번호는 반드시 100보다 작아야합니다.");
		  event.preventDefault(); //default event취소(서버전송중단)
		  $(empobj).val("");
		  $(empobj).focus();
		  return;
	  }
	  if(!isDupCheck){
		  alert("중복체크는 필수입니다.");
		  event.preventDefault();
	  }
  }
  
</script>
<!-- <script type="text/javascript">
  //고전이벤트 모델 : 객체.이벤트속성 = 이벤트핸들러  
  window.onload = function(){
	  //onsubmit는 default event이다. 이미 이벤트핸들러가 만들어져있다. 
	  //submit버튼을 누르면 form의 input들이 서버에 전송된다.
	  //개발자가 이벤트핸들러를 넣으면 먼저수행하고 default이벤트핸들러도 수행된다. 
	  //default이벤트핸들러를 취소하려면 return false;
	  document.querySelector("#myfrm").onsubmit = function(){
		  var empid = document.querySelector('input[name="employee_id"]').value;
		  console.log("*" + empid + "*");
		  //DB:trim("aa ")
		  //언어:"aa ".trim()
		  if(empid.trim() == ""){
			  alert('직원번호는 필수칼럼입니다.');
			  return false;  
		  }
		  
	  };
  };
</script> -->

<script>
  $(function(){
	  $("#btn_dup").on("click", f_dupCheck);
	  $("input[name='employee_id']").on("keyup", f_keyup);
  });
  function f_keyup(){
	  var empid = $(this).val().length;
	  console.log(empid);
	  if(empid>0){
		  $("#btn_dup").removeAttr("disabled");
	  }else{
		  $("#btn_dup").attr("disabled","disabled");
	  }
  }
  function f_dupCheck(){
	  var empid = $("input[name='employee_id']").val();
	  /*
	  $.ajax({
		  url:"EmpDupCheck.jsp?empid=" + empid,
		  type:"get",
		  success : function(responseData){
			  $("#here").text(responseData);
		  }
	  });*/
	  $.ajax({
		  url:"EmpDupCheck.jsp",
		  type:"post",
		  data:{"empid" : empid  },
		  success : function(responseData){
			  $("#here").text(responseData);
			  if(responseData.trim()=='NO'){
				  $("input[name='employee_id']").val("");
				  $("input[name='employee_id']").focus();
				  isDupCheck = false;
			  }else{
				  isDupCheck = true;
			  }
		  }
	  });
	  
  }
  
</script>
 
</head>
<body>
<!-- JSP(Java Server Page) : 
         동적HTML생성함 
         HTML + JAVA가능 
         -->
<div id="container">
    
    <a href="empAll.jsp">직원조회</a>
	<h1>직원등록</h1>
	<!-- /로 시작하면 절대경로
	     /시작 아니면 상대경로 
	     ./ 생략됨 
	 -->
	<form id="myfrm" action="empRegister.jsp"   method="get" >
		<label>직원번호:</label>
		<input required="required"    class="required"  type="number" name="employee_id">
		<span>
		  <input disabled="disabled" id="btn_dup" type="button" value="중복체크">		  
		</span>
		<span id="here">여기</span>
		<br>
		
		<label>부서번호:</label>
		
		<select name="department_id">
		  <%
		    for(DeptDTO dept:deptlist){
		  %>
		     <option value="<%=dept.getDepartment_id() %>" >
		         <%=dept.getDepartment_name() %>
		     </option>
		  <%} %>		
		</select>

		<br>
		<label>상사번호:</label>
		<select name="manager_id">
		<%for(EmpDTO emp:emplist){ %>
		  <option value="<%=emp.getEmployee_id() %>">
		      <%=emp.getFirst_name() %>
		      <%=emp.getLast_name() %>
		  </option>
		<%} %>  
		</select>
		
		
		
		<br>
		<label>급여:</label>
		<input type="number" name="salary"><br>
		<label>커미션:</label>
		<input type="text" name="commission_pct"><br>
		<label >이메일:</label>
		<input required="required"   class="required" type="text" name="email"><br>
		<label>fname:</label>
		<input type="text" name="first_name"><br>
		<label>lname:</label>
		<input  class="required" type="text" name="last_name"><br>
		<label>job:</label>
		 
		<select  required="required" name="job_id" class="required">
		   <% for(JobDTO job:joblist){ %>
		      <option value="<%=job.getJob_id() %>"><%=job.getJob_title() %></option>
		   <% }%>
		</select>
		
		<br>
		<label>phone:</label>
		<input type="text" name="phone_number"><br>
		<label>입사일:</label>
		<input required="required" class="required" type="date" name="hire_date"><br>
		<input type="submit" value="직원저장(submit서버전송go)">
		<input id="btn_goback" type="button" value="직원저장(서버goback-Ajax)">		
	</form>
	<div id="resultPrint">
	</div>
</div>
<script>
 $("#btn_goback").on("click", f_goback);
 function f_goback(){
	 var uri = $("#myfrm").serialize();
	 console.log(uri);
	 
	 <%--JSP에서 백틱은 JSP의 ${aa}와 충돌됨....그래서 $를 \$로 사용--%>
	 $.ajax({
		 url : `empRegister.jsp?\${uri}`,
		 type: "get",
		 success : function(responseData){
			 console.log(responseData);
			 $("#resultPrint").html(responseData);
		 },
		 error:function(err){
			 console.log(err);
		 }
	 });
 }
</script>
</body>
</html>






