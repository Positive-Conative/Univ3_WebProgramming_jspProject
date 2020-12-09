<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>

<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("num")!=null && request.getParameter("pw")!=null && request.getParameter("pwch")!=null && request.getParameter("name")!=null && request.getParameter("ph1")!=null && request.getParameter("ph2")!=null && request.getParameter("ph3")!=null){
	String phone = request.getParameter("ph1") + request.getParameter("ph2") + request.getParameter("ph3");
	int result = user_infoDAO.signup(request.getParameter("num"), request.getParameter("pw"), request.getParameter("name"), phone);
	if(result == 2){
		out.println("<script>alert('해당 학번은 이미 가입되어 있습니다.');</script>");
	}
	else if(result == 1){
		out.println("<script>alert('회원가입 되었습니다.'); location.href=\'signin.jsp \'</script>");
	}
	else{
		
	}
}
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./public/stylesheets/signup.css">
	<script src='https://www.google.com/recaptcha/api.js'></script>
	<script>
		function sub(){
			if(grecaptcha.getResponse().length == 0){
				alert('Please reCAPTCHA Check');
				return false;
			}
			else{
				if(document.getElementById('agree').checked == true){
					if(num_check() == true && ph_check() == true && passwd_check() == true && equals() == true){
						return true;
					}
					else{
						alert('Please checked input');
						return false;
					}
				}
				else{
					alert('Please agree to privacy statement');
					return false;
				}
			}
		}
	</script>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <div class="form">
    	<a href="#"><img class="prev" src="./public/images/exit1.png" alt="" onclick="back()"></a><br>
        <div class="head">약관 동의</div>
        <hr color="lightgray" width="550px">
        <a href="#" onclick="show()"><div align=left class="check"><input type="checkbox" style="width: 15px; height: 15px; margin-top: 5px;" id=agree><span style="margin-bottom: 5px;"><span style="font-size: 20px;">개인정보 수집 및 이용 동의</span></div></a>
        <div class="r"></div>

		<form onsubmit="return sub();" method="POST">
        	<div align=left class="label">학번<span class="help_form" id="num_ch"></span></div>
        	<input type="text" class="input_value" id="num" placeholder="학번" onblur="num_check()" name="num">
        	<div align=left class="label">비밀번호<span class="help_form" id="pw_ch"></span></div>
        	<input type="password" class="input_value" id="pw" onblur="passwd_check()" placeholder="비밀번호 (영문자, 숫자 포함 10자리 이상)" name="pw">
        	<div align=left class="label">비밀번호 확인<span class="help_form" id="pwch_ch"></span></div>
        	<input type="password" class="input_value" id="pwch" onblur="equals()" placeholder="비밀번호 확인" name="pwch">
        	<div align=left class="label">이름</div>
        	<input type="text" class="input_value" id="name" placeholder="이름" name="name">
        	<div align=left class="label">휴대폰 번호<span class="help_form" id="ph_ch"></span></div>
        	<div style="font-family: maple;">
            	<input type="text" class="phone" id="ph1" onblur="ph_check()" name="ph1" maxlength=3> - 
            	<input type="text" class="phone" id="ph2" onblur="ph_check()" name="ph2" maxlength=4> - 
            	<input type="text" class="phone" id="ph3" onblur="ph_check()" name="ph3" maxlength=4>
        	</div>
        
        	<div align=center style="margin-top: 20px">
			    <div class="g-recaptcha" data-sitekey="6LeolOMZAAAAAPVRPOOcJCOk1iiNOcNO5P2_djl7"></div>
    		</div>
    		
        	<input class="sub" type="submit" value="가입하기">
        </form>
    </div>
    
    <div class="pop" id="modal">
    	<div class="view">
            	[개인정보 수집 및 이용 동의]<br><br>

            	HOSEOWORLD은 다음과 같이 개인정보를 수집 및 이용하고 있습니다.<br><br>

            	- 수집 및 이용 목적: 회원 가입, 게시판서비스 제공, 이용자 식별<br>
            	- 항목: 학번, 비밀번호<br><br>

        	    - 수집 및 이용 목적: 본인확인, 이용자 식별, 부정이용 방지, 중복가입 방지<br>
    	        - 항목: 이름, 휴대폰번호<br><br>

	            - 보유 및 이용기간: 회원탈퇴일로부터 30일<br>
            	(법령에 특별한 규정이 있을 경우 관련 법령에 따라, 부정이용기록은 회원탈퇴일로부터 1년)<br><br>

            	동의를 거부할 경우 회원가입이 불가능 합니다.<br><br>

            	※ 그 외의 사항 및 자동 수집 정보와 관련된 사항은 개인정보처리방침을 따릅니다.<br><br>
            <div align=center>
    	        <button class="can" onclick="info_no()">거부</button>
                <button class="sub" onclick="info_agree()">동의</button>
            </div>
        </div>
    </div>
</body>
</html>

<script type="text/javascript">

function show(){
    document.getElementById('modal').style.display='block';
}

function info_agree(){
    document.getElementById('modal').style.display='none';
    document.getElementById('agree').checked = true;
}
function info_no(){
    document.getElementById('modal').style.display='none';
    document.getElementById('agree').checked = false;
}

function num_check(){
    var num = document.getElementById("num").value;
    var num_ch = document.getElementById("num_ch");
    if(isNaN(num)){
        num_ch.innerHTML = "학번이 잘못 되었습니다.";
        return false;
    }
    else{
        num_ch.innerHTML = " ";
        return true;
    }
}

function ph_check(){
    var ph1 = document.getElementById("ph1").value;
    var ph2 = document.getElementById("ph2").value;
    var ph3 = document.getElementById("ph3").value;
    
    var ph_ch = document.getElementById("ph_ch");
    if(isNaN(ph1) || isNaN(ph2) || isNaN(ph3)){
        ph_ch.innerHTML = "전화번호가 잘못 되었습니다.";
        return false;
    }
    else{
        ph_ch.innerHTML = " ";
        return true;
    }
}

function passwd_check(){
    var pw = document.getElementById("pw").value;
    var pw_ch = document.getElementById("pw_ch");
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
    	pw_ch.innerHTML = " ";
        return false;
    }
    
    if(num == true && eng == true && count == true){
    	pw_ch.innerHTML = " ";
        return true;
    }
    else{
    	pw_ch.innerHTML = "비밀번호가 양식과 맞지 않습니다.";
        return false;
    }
}

function equals(){
    var pw = document.getElementById("pw");
    var pwch = document.getElementById("pwch");
    var pwch_ch = document.getElementById("pwch_ch");
    if(pw.value != pwch.value){
        pwch_ch.innerHTML = "비밀번호가 서로 다릅니다.";
        return false;
    }
    else{
        pwch_ch.innerHTML = " ";
        return true;
    }
}

function back(){
    window.history.back();
}
</script>