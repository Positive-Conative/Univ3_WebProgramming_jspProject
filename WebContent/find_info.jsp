<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./public/stylesheets/find_info.css">
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <div class="form">
    	<a href="#"><img class="prev" src="./public/images/exit1.png" alt="" onclick="back()"></a><br>
        <div class="head">PW 찾기</div>
        <hr color="lightgray" width="350px">
        <div class="r"></div>

		<form onsubmit="return sub();" method="POST">
        	<div align=left class="label">학번</div>
        	<input type="text" class="input_value" id="num" placeholder="학번" onblur="num_check()" name="num">
        	<div align=left class="label">이름</div>
        	<input type="text" class="input_value" id="name" placeholder="이름" name="name">
        	<div align=left class="label">휴대폰 번호</div>
        	<div style="font-family: maple;">
            	<input type="text" class="phone" id="ph1" onblur="ph_check()" name="ph1" maxlength=3> - 
            	<input type="text" class="phone" id="ph2" onblur="ph_check()" name="ph2" maxlength=4> - 
            	<input type="text" class="phone" id="ph3" onblur="ph_check()" name="ph3" maxlength=4>
        	</div>
        
        	<input class="sub" type="submit" value="찾기">
        </form>
    </div>
</body>
</html>

<script type="text/javascript">
function back(){
    window.history.back();
}
</script>

<%
	request.setCharacterEncoding("UTF-8");

	if(request.getParameter("num")!=null && request.getParameter("name")!=null && request.getParameter("ph1")!=null && request.getParameter("ph2")!=null && request.getParameter("ph3")!=null){
		String phone = request.getParameter("ph1") + request.getParameter("ph2") + request.getParameter("ph3");
		if(user_infoDAO.check_user(request.getParameter("num"), request.getParameter("name"), phone)){
			session.setAttribute("check_info", request.getParameter("num"));
			response.sendRedirect("change_pw.jsp");
		}
		else{
			out.print("<script>alert('일치하는 정보가 없습니다.');</script>");
		}
	}

%>