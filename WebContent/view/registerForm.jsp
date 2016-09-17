<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div.ex {
		text-align: center;
		width: 35%;
		padding: 10px;
		boarder: 5px solid grey;
		margin: 20px;
	}
</style>
</head>
<body>
	<h1>Registration Form</h1>
	<div class="ex">
		<form action="/helloMVC/doRegister" method="post">
			<table cellpadding="5">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input id="man" type="radio" name="gender" value="man"/><label for="man">남자</label>
						<input id="woman" type="radio" name="gender" value="woman"/><label for="woman">여자</label>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="register" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>