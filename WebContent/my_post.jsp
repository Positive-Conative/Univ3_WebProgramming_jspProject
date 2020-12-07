<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>

<%
	String num = "20161468";
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./public/stylesheets/my_post.css">
</head>
<body>
	<img src="./public/images/mainimg2.jpg" style="width: 100%">
	<div class="tag">
		내 글 확인 
	</div>
	<hr width="90%" style="margin-top: 30px">
	<table style="width: 100%; padding-left: 5%; padding-right: 5%;">
		<tr>
			<td class="front_main">
				<div class="menu"><a href="./infomation.jsp">개인 정보 수정</a></div><br>
				<div class="menu"><a href="./my_post.jsp">사용자 글 확인</a></div><br>
			</td>
			<td class="back_main">
				<div style="text-align: center">
					<table width="100%">
						<tr>
							<td class="front_sub">
								<div style="font-size: 20px; margin-bottom: 15px;">거래게시판</div>
								<table width="100%" style="border-collapse: collapse; border-spacing: 0">
									<thead>
										<td width="10%" class="table_border">번호</td>
										<td width="60%" class="table_border">제목</td>
										<td width="30%" class="table_border">작성일</td>
									</thead>
									<tr>
										<td class="table_border">1</td>
										<td class="table_border">샘플</td>
										<td class="table_border">2020-12-08</td>
									</tr>
								</table>
							</td>
							<td class="back_sub">
								<div style="font-size: 20px; margin-bottom: 15px;">자유게시판</div>
								<table width="100%" style="border-collapse: collapse; border-spacing: 0">
									<thead>
										<td width="10%" class="table_border">번호</td>
										<td width="60%" class="table_border">제목</td>
										<td width="30%" class="table_border">작성일</td>
									</thead>
									<tr>
										<td class="table_border">1</td>
										<td class="table_border">샘플</td>
										<td class="table_border">2020-12-08</td>
									</tr>
									<tr>
										<td class="table_border">2</td>
										<td class="table_border">샘플</td>
										<td class="table_border">2020-12-08</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="import/footer.jsp" %>

<script type="text/javascript">

function back(){
    window.history.back();
}

</script>
