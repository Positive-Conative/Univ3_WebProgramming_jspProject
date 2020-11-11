<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="public/stylesheets/index.css" rel="stylesheet"/>
    <title>Document</title>
</head>
    <body>
        <header>
        	<div style="cursor:pointer;">
        		<img src="public/images/logo.PNG" onclick="location.href='index.jsp'"/>
        	</div>
            
            <nav>
                <li>거래게시판</li>
                <li>자유게시판</li>
                <li>고객센터</li>
                <li onclick="location.href='developerIndex.jsp'">개발자 정보</li>
                <div class="navRight">
                LOG IN
                    <input type="text" placeholder="Search"/>
                    <button type="submit"><img src="public/images/loupe.png"></button>
                </div>
            </nav>
        </header>