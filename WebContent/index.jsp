<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>

<%
	session.getAttribute("num");

	String num = (String)session.getAttribute("num");

	if(num == null || num.equals("")){
		out.println("<script>alert('no session')</script>");
	}
	else{
		out.println("<script>alert('use session')</script>");
	}
%>

<div class="img_section">
    <img id="mainimg" src="public/images/mainimg2.jpg" alt="LOGO"/>
    <div id="mainimg_text">
        <h1>호서나라</h1>
        호서대학교 학생들을 위한, 가장 가까운 중고마켓<br>
        <input type="button" value="더 알아보기&gt;&gt;"/>
    </div>
</div>

<section class="board_section">
    <div id="market">
        <h3>거래 게시판</h3>
        <div id="card_container">
            <div class="card">
                <img src="public/images/mainimg2.jpg"/>
                #hashtags #hashtags #hashtags
                <div class="card_footer">
                    KimyoungJae
                </div>
            </div>
            <div class="card">
                <img src="public/images/mainimg2.jpg"/>
                #hashtags #hashtags #hashtags
                <div class="card_footer">Conative</div>
            </div>
            <div class="card">
                <img src="public/images/logo.PNG"/>
                #hashtags #hashtags #hashtags
                <div class="card_footer">Holly</div>
            </div>
        </div>
    </div>
    <div id="free">
        <h3>자유 게시판</h3>
        <table>
            <thead>
                <tr>
                   <th>제목</th> 
                   <th>글쓴이</th>
                   <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>자유게시판 공지입니다.</td>
                    <td>김영재</td>
                    <td>15</td>
                </tr>
                <tr>
                    <td>안녕하세요</td>
                    <td>김영재</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>안녕하세요</td>
                    <td>권순영</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>안녕하세요</td>
                    <td>김동헌</td>
                    <td>13</td>
                </tr>
                <tr>
                    <td>ㅋㅋ루삥뽕</td>
                    <td>ㅋㅋ</td>
                    <td>13</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<%@ include file="import/footer.jsp" %>
