<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<%session.removeAttribute("info_check");%>
<!DOCTYPE html>
<%
	if((String)session.getAttribute("check_info") == null){
		out.print("<script>alert('잘못된 접근입니다.');</script>");
		response.sendRedirect("index.jsp");
	}

	String id = (String)session.getAttribute("check_info");
%>

<html>
<head>
	<script>
		function sub(){
			if(passwd_check() == true && equals() == true){
				return true;
			}
			else{
				alert('Please checked input');
				return false;
			}
		}
	</script>
    <link rel="stylesheet" type="text/css" href="./public/stylesheets/change_pw.css">
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <div onsubmit="return sub()" class="form">
    	<a href="#"><img class="prev" src="./public/images/exit1.png" alt="" onclick="back()"></a><br>
        <div class="head">PW 변경</div>
        <hr color="lightgray" width="350px">
        <div class="r"></div>

		<form method="POST">
        	<div align=left class="label">비밀번호</div>
        	<input type="password" class="input_value" id="pw" onblur="passwd_check()" placeholder="비밀번호 (영문자, 숫자 포함 10자리 이상)" name="pw">
        	<div align=left class="label">비밀번호 확인</div>
        	<input type="password" class="input_value" id="pwch" onblur="equals()" placeholder="비밀번호 확인" name="pwch">
        	<input class="sub" type="submit" value="변경">
        </form>
    </div>
</body>
</html>
<script>
function passwd_check(){
    var pw = document.getElementById("pw").value;
    var num = false;
    var eng = false;
    var count = false;
    if(pw.length > 9)
        count = true;
    for(var i = 0; i< pw.length; i++){
        var code = pw.charCodeAt(i);
        if(47 < code && code < 58);
            num = true;
        if((64 < code && code < 91) || (96 < code && code < 123))
            eng = true;
    }
    
    if(pw == ""){
        return false;
    }
    
    if(num == true && eng == true && count == true){
        return true;
    }
    else{
        return false;
    }
}

function equals(){
    var pw = document.getElementById("pw");
    var pwch = document.getElementById("pwch");
    if(pw.value != pwch.value){
        return false;
    }
    else{
        return true;
    }
}
</script>

<%
	request.setCharacterEncoding("UTF-8");

	if(request.getParameter("pw")!=null && request.getParameter("pwch")!=null){
		if(user_infoDAO.change_pw(id, request.getParameter("pw"))){
			session.removeAttribute("check_info");
			response.sendRedirect("index.jsp");
		}
	}

%>