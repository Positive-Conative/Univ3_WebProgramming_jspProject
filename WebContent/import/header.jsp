<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="public/stylesheets/index.css" rel="stylesheet"/>
    <title>Hoseo World</title>
</head>
    <body>
        <header>
        	<div style="cursor:pointer;">
        		<img src="public/images/logo.PNG" onclick="location.href='index.jsp'"/>
        	</div>
            
            <nav>
                <li onclick="location.href='marketboard.jsp?pnum=1'">거래게시판</li>
                <li onclick="location.href='freeboard.jsp?pnum=1'">자유게시판</li>
                <li onclick="location.href='notice.jsp?pnum=1'">고객센터</li>
                <li onclick="location.href='developerIndex.jsp'">개발자 정보</li>
                <%
                	String authority = null;
                	if((String)session.getAttribute("student_num") != null){
                		authority = user_infoDAO.get_authority((String)session.getAttribute("student_num"));
                		if(authority.equals("1"))
                			out.print("<li style=\"color:blue\" onclick=\"location.href='adminQna.jsp?pnum=1'\">관리자</li>");
                	}
                %>
                <div class="navRight">
                    <input type="text" placeholder="Search"/>
                    <button class="bt" type="submit" style="width:25px;"><img src="public/images/loupe.png"></button>
					<%
						if((String)session.getAttribute("student_num") == null){
							out.print("<div id=\"loginbtn\" onclick=\"location.href='signin.jsp'\">LOG IN</div>");
						}else{
							if(!authority.equals("1"))
								out.print("<div style=\"margin-right: 10px\"id=\"loginbtn\" onclick=\"location.href='infomation.jsp'\">내 정보</div>");
							out.print("<div id=\"loginbtn\" onclick=\"location.href='signout.jsp'\">LOG OUT</div>");
						}
					%>
                </div>
            </nav>
        </header>
        
        <style>
        	#loginbtn{
        		display:inline-block;
        		cursor:pointer;
        	}
        	#loginbtn:hover{
        		color:red;
        	}
        </style>