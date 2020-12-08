<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
                <li>거래게시판</li>
                <li>자유게시판</li>
                <li onclick="location.href='notice.jsp?pnum=1'">고객센터</li>
                <li onclick="location.href='developerIndex.jsp'">개발자 정보</li>
                <li style="color:blue" onclick="location.href='adminQna.jsp?pnum=1'">관리자</li>
                <div class="navRight">
                    <input type="text" placeholder="Search"/>
                    <button class="bt" type="submit" style="width:25px;"><img src="public/images/loupe.png"></button>
                <a>LOG IN</a>
                </div>
            </nav>
        </header>
        