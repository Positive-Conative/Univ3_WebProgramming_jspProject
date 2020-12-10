<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>    
<!DOCTYPE html>
<html>
<head>
<link href="public/stylesheets/error.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>404 Not found</title>
</head>
<body style="background-color: lightgray">
<div class="source">img @ https://www.freepik.com/free-vector/no-data-concept-illustration_5928292.htm#page=1&query=not%20found&position=1</div>
<div class="form">
	<img src="./public/images/404.jpg" style="width: 90%; padding: 5%;">
	<div style="font-size: 70px; font-family: maple; margin-left: 5%">Oops!</div>
	<div style="font-size: 20px; font-family: maple; margin: 5%">Error Code : 404</div>
	<div style="font-size: 30px; font-family: maple; margin-left: 5%">We can't seem to find the page<br>you're looking for.</div>
	<div align="right" style="font-size: 30px; font-family: maple; margin-right: 5%"><a href="./index.jsp">Go Home >></a></div>
</div>
</body>
</html>