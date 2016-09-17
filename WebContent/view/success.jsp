<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%-- JSP Expression Language --%>
	<ul>
		<li> Id: ${customer.id }</li>
		<li> Name: ${customer.name }</li>
		<li> Email: ${customer.email }</li>
	</ul>
	
	<%-- JSTL --%>
	
	<table style="border: 1px solid red; pading: 10px;">
	  <c:forEach var="customer" items="${customerList}">
		<tr>
			<td>${customer.id }</td>
			<td>${customer.name }</td>
			<td>${customer.email }</td>
		</tr>
	  </c:forEach>
	</table>
</body>
</html>