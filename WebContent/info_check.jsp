<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<%
	if((String)session.getAttribute("student_num") == null){
		response.sendRedirect("index.jsp");
	}
	JSONObject result = user_infoDAO.get_info((String)session.getAttribute("student_num"));
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./public/stylesheets/info_check.css">
</head>
<body>
	<img src="./public/images/mainimg2.jpg" style="width: 100%">
	<div class="tag">
		내 정보
	</div>
	<hr width="90%" style="margin-top: 30px">
	<table style="width: 100%; padding-left: 5%; padding-right: 5%;">
		<tr>
			<td class="front_main">
				<div class="menu"><a href="./info_check.jsp">개인 정보 수정</a></div><br>
				<div class="menu"><a href="./my_post.jsp">사용자 글 확인</a></div><br>
			</td>
			<td class="back_main">
				<form onsubmit="return sub()" method="POST">
				<div style="text-align: center">
					<div style="font-size: 25px; margin-bottom: 30px">비밀번호 확인</div>
					<div style="border: 1px solid black; width: 70%; margin-left: 15%; margin-right: 15%">
						<div align="left" style="margin-top: 10px; margin-bottom: 10px; margin-left: 10px"> · 안전한 서비스를 위하여 비밀번호를 다시 한 번 확인해주세요.</div>
						<input class="pw" type="password" placeholder="비밀번호" id="pw" name="pw">
						<hr width="250px" style="margin-bottom: 10px">
					</div>
					<div align=center>
                		<input type="submit" class="sub" value="확인">
            		</div>
				</div>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="import/footer.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

if(request.getParameter("pw")!=null){
	int login_value = user_infoDAO.signin((String)session.getAttribute("student_num"), request.getParameter("pw"));
	if(login_value == 1){
		session.setAttribute("info_check", "check");
		response.sendRedirect("infomation.jsp");
	}
	else{

	}
}
%>