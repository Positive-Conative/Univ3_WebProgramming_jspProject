<%@page import="com.sun.jdi.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./public/stylesheets/signin.css">

    <meta charset="UTF-8">
    <title>Sign In</title>
</head>
<body>
	<div class="form">
        	<a href="#"><img class="prev" src="./public/images/exit1.png" alt="" onclick="back()"></a><br>
        	<a href="index.jsp"><img class="logo" src="./public/images/logo.PNG"></a><br>
       		<form method="post">
        		<input class="id" type="text" placeholder="학번" id="num" name="num"><br>
	        	<hr width="250px">
        		<input class="pw" type="password" placeholder="비밀번호" id="pw" name="pw"><br>
        		<hr width="250px">
        		<div style="margin: 30px"></div>
        		<input type="submit" class="bt" value="로그인"><br>
        	</form>
        	<a href="./signup.jsp"><button class="bt">회원가입</button></a><br>
	        <a href=""><div class="mg">비밀번호를 잊으셨나요?</div></a>
    	</div>
</body>
</html>

<%
request.setCharacterEncoding("UTF-8");

if(request.getParameter("num")!=null && request.getParameter("pw")!=null){
	int login_value = user_infoDAO.signin(request.getParameter("num"), request.getParameter("pw"));
	if(login_value == 1){
		out.println("<script>alert('Success')</script>");
		session.setAttribute("student_num", request.getParameter("num"));
		response.sendRedirect("index.jsp");
	}
	else if(login_value == -1){
		out.println("<script>alert('해당 ID는 현재 정지 상태입니다')</script>");
	}
	else{
		out.println("<script>alert('Fail')</script>");
	}
}
%>

<script type="text/javascript">

function back(){
    window.history.back();
}
</script>