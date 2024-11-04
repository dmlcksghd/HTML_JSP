<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label {
	display: block;
	padding: 5px;
	margin: 5px;
}

#container {
	width: 70%;
	/* border: 1px dotted gray; */
	margin: 0 auto;
}

input[type="text"], input[type="number"], input[type="submit"] {
	width: 100%; /* 모든 입력 상자와 버튼의 너비를 동일하게 설정 */
	padding: 5px;
	box-sizing: border-box; /* 패딩 포함하여 크기 계산 */
}

#submitButton {
	/* border: 1px dotted gray; */
	padding: 20px 0 0 0;
}
</style>
</head>
<body>
	<div id="container">
		<h1>부서등록</h1>
		<form action="deptRegister.jsp">
			<label>부서 번호</label> <input type="number" name="department_id">
			<label>부서 이름</label> <input type="text" name="department_name">
			<label>지역 번호</label> <input type="number" name="location_id"
				value="2000"> <label>매니저</label> <input type="number"
				name="manager_id" value="100">
			<div id="submitButton">
				<input type="submit" value="부서입력">
			</div>
		</form>
	</div>
</body>
</html>