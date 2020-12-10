<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<!DOCTYPE html>

<%
	if((String)session.getAttribute("student_num") == null){
		out.print("<script>alert('로그인 후 이용할 수 있는 기능입니다.');</script>");
		out.print("<script>window.history.back()</script>");
	}
	else{
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
				<div class="menu"><a href="./info_check.jsp">개인 정보 수정</a></div><br>
				<div class="menu"><a href="./my_post.jsp">사용자 글 확인</a></div><br>
			</td>
			<td class="back_main">
				<div style="text-align: center">
					<table width="100%">
						<tr>
							<td class="front_sub">
								<div style="font-size: 20px; margin-bottom: 15px;">자유게시판</div>
								<table width="100%" style="border-collapse: collapse; border-spacing: 0">
									<thead>
										<td width="10%" class="table_border">번호</td>
										<td width="60%" class="table_border">제목</td>
										<td width="30%" class="table_border">작성일</td>
									</thead>
									<%
										String b_db_data = user_infoDAO.get_board((String)session.getAttribute("student_num"));
										int b_i = 0;
										JSONParser parser = new JSONParser();
										Object b_result = parser.parse(b_db_data);
										JSONArray b_resultArr = (JSONArray)b_result;
										for(b_i=0; b_i<b_db_data.length(); b_i++){
											try{
												JSONObject element = (JSONObject)b_resultArr.get(b_i);
												String Num = (String)element.get("Num");
												String title = (String)element.get("Title");
												String date = (String)element.get("Date");							
									%>
									<tr onclick="location.href='./freedetail.jsp?Num=<%= Num%>'">
										<td class="table_border"><%= b_i+1 %></td>
										<td class="table_border"><%= title %></td>
										<td class="table_border"><%= date %></td>
									</tr>
									<%}catch(Exception e){ continue; }} %>
								</table>
							</td>
							<td class="back_sub">
								<div style="font-size: 20px; margin-bottom: 15px;">거래게시판</div>
								<table width="100%" style="border-collapse: collapse; border-spacing: 0">
									<thead>
										<td width="10%" class="table_border">번호</td>
										<td width="60%" class="table_border">제목</td>
										<td width="30%" class="table_border">작성일</td>
									</thead>
									<%
										String m_db_data = user_infoDAO.get_market((String)session.getAttribute("student_num"));
										int m_i = 0;
										JSONParser m_parser = new JSONParser();
										Object m_result = parser.parse(m_db_data);
										JSONArray m_resultArr = (JSONArray)m_result;
										for(m_i=0; m_i<m_db_data.length(); m_i++){
											try{
												JSONObject element = (JSONObject)m_resultArr.get(m_i);
												String mid = (String)element.get("mid");
												String title = (String)element.get("Title");
												String date = (String)element.get("Date");							
									%>
									<tr onclick="location.href='./marketDetail.jsp?mid=<%= mid%>'">
										<td class="table_border"><%= m_i+1 %></td>
										<td class="table_border"><%= title %></td>
										<td class="table_border"><%= date %></td>
									</tr>
									<%}catch(Exception e){ continue; }} %>
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

<%
	}
%>
