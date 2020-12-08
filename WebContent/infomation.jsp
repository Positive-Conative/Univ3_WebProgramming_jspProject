<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>

<%
	JSONObject result = user_infoDAO.get_info();
	String get_phone = result.get("3").toString();
	String ph1 = get_phone.substring(0, 3);
	String ph2 = get_phone.substring(3, 7);
	String ph3 = get_phone.substring(7, 11);
%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./public/stylesheets/infomation.css">
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
				<div class="menu"><a href="./infomation.jsp">개인 정보 수정</a></div><br>
				<div class="menu"><a href="./my_post.jsp">사용자 글 확인</a></div><br>
			</td>
			<td class="back_main">
				<form onsubmit="return sub()" method="POST">
				<div style="text-align: center">
					<div style="font-size: 25px; margin-bottom: 30px">개인 정보 수정</div>
					<table style="padding 30px; width: 100%; border-collapse: collapse; border-spacing: 0">
						<tr>
							<td class="front_sub">
								학번
							</td>
							<td class="back_sub">
								<div style="font-size: 20px"><%= result.get("1") %></div>
							</td>
						</tr>
						<tr>
							<td class="front_sub">
								비밀번호 변경
							</td>
							<td class="back_sub">
								<div align="left" class="help_form" id="pw_ch"> </div>
								<input type="password" class="input_value" id="pw" onblur="passwd_check()" placeholder="비밀번호 (영문자, 숫자 포함 10자리 이상)" name="pw"">
							</td>
						</tr>
						<tr>
							<td class="front_sub">
								비밀번호 확인
							</td>
							<td class="back_sub">
								<div align="left" class="help_form" id="pwch_ch"> </div>
								<input type="password" class="input_value" id="pwch" onblur="equals()" placeholder="비밀번호 확인" name="pwch">
							</td>
						</tr>
						<tr>
							<td class="front_sub">
								이름
							</td>
							<td class="back_sub">
								<input type="text" class="input_value" id="name" placeholder="이름" name="name" value="<%= result.get("2")%>">
							</td>
						</tr>
						<tr>
							<td class="front_sub">
								휴대폰 번호
							</td>
							<td class="back_sub">
								<div align="left" class="help_form" id="ph_ch"> </div>
								<div>
            						<input type="text" class="phone" id="ph1" onblur="ph_check()" name="ph1" maxlength=3 value="<%= ph1 %>"> - 
            						<input type="text" class="phone" id="ph2" onblur="ph_check()" name="ph2" maxlength=4 value="<%= ph2 %>"> - 
            						<input type="text" class="phone" id="ph3" onblur="ph_check()" name="ph3" maxlength=4 value="<%= ph3 %>">
        						</div>
							</td>
						</tr>
						<tr>
							<td class="front_sub">
								주소
							</td>
							<td class="back_sub">
								<input type="text" class="input_value" id="address" placeholder="주소" name="address" value="<%= result.get("4")%>">
							</td>
						</tr>
					</table>
					<div align=center>
                		<input type="submit" class="sub" value="저장">
            		</div>
				</div>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="import/footer.jsp" %>

<script type="text/javascript">

function sub(){
	if(document.getElementById("pw").value != document.getElementById("pwch").value){
		alert("비밀번호가 서로 다릅니다.");
		return false;
	}
	else{
		var num = false;
	    var eng = false;
	    var count = false;

	    var pw = document.getElementById("pw").value;
	    
	    if(pw.length > 9)
	        count = true;

	    for(var i = 0; i< pw.length; i++){
	        var code = pw.charCodeAt(i);

	        if(47 < code && code < 58);
	            num = true;

	        if((64 < code && code < 91) || (96 < code && code < 123))
	            eng = true;
	    }

	    if(num == false || eng == false || count == false){
	    	alert("비밀번호가 양식에 맞지 않습니다.");
	    	return false;
	    }
	    else{
	    	return true;
	    }
	}
}

function back(){
    window.history.back();
}


</script>

<%
request.setCharacterEncoding("UTF-8");

if(request.getParameter("pwch")!=null && request.getParameter("pw")!=null && request.getParameter("name")!=null && request.getParameter("ph1")!=null && request.getParameter("ph2")!=null && request.getParameter("ph3")!=null && request.getParameter("address")!=null){
	String phone = request.getParameter("ph1") + request.getParameter("ph2") + request.getParameter("ph3");
	if(user_infoDAO.change_info("20161468", request.getParameter("pw"), request.getParameter("name"), phone, request.getParameter("address"))){
		
	}
}	
%>
