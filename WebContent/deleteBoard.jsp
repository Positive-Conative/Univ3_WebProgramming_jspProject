<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<jsp:useBean id="freeBoard_DAO" scope="page" class="com.webServer.freeBoardDAO"/>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<link href="public/stylesheets/deleteBoard.css" rel="stylesheet"/>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String Type = request.getParameter("boardType");
	String Num = request.getParameter("boardNum");
	String push = request.getParameter("push");
	
	if(Type == null && Num == null){
		out.print("<script>window.history.back()</script>");
	}
	else{
		if(push == null){

		}
		else{
			if(Type.equals("market")){
				marketBoard_DAO.deleteToDB(Num);
				out.print("<script>window.close()</script>");
			}
			else if(Type.equals("free")){
				freeBoard_DAO.deleteToDB(Num);
				out.print("<script>window.close()</script>");
			}
		}
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: lightgray;">
	<div class="form" style="font-family: maple-b;">
		<div style="padding-bottom: 5px;">해당 게시글을<br>삭제하시겠습니까?</div>
		<form method="POST" style="display: inline;" >
			<input type="hidden" name="boardType" value="<%= Type %>" id="boardType">
			<input type="hidden" name="boardNum" value="<%= Num %>" id="boardNum">
			<input type="hidden" name="push" value="push" id="push">
			<input type="submit" class="bt" value="예">
		</form>
		<button class="bt" onclick="closepop()">아니오</button>
	</div>
</body>
</html>

<script>
	function closepop(){
		window.close();
	}
</script>
