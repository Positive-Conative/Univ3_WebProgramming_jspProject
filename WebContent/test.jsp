<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="report_DAO" scope="page" class="com.webServer.serviceCenterDAO"/>
<%session.removeAttribute("info_check");%>
<jsp:setProperty name="report_DAO" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	ID : <jsp:getProperty name="report_DAO" property="accused"/>
</body>
</html>