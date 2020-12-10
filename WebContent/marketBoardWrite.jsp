<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@include file="import/header.jsp" %>

<%
	if((String)session.getAttribute("student_num") == null){
		out.print("<script>alert('로그인 후 이용할 수 있는 기능입니다.');</script>");
		out.print("<script>window.history.back()</script>");
	}
	else{
		String user_id = (String)session.getAttribute("student_num");
%>

    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>게시글 작성</h1>
                	자유로운 게시글을 작성해주세요
            </div>
        </div>

        <form  enctype="multipart/form-data" method="POST" action="marketBoardInsert.jsp">
        <table class="content">
		<tr>
	      <th>작성자 ID</th>
	      <td colspan="3">
	       	<div style="text-align: left; margin-left: 1%"><%= user_id %></div>
		   </td>
		</tr>
		<tr>
		    <th>제 목</th>
		    <td colspan="3">
				<input type="text" name="title" placeholder="제목을 작성해주세요."/>
		    </td>
		</tr>
		<tr>
		    <th>내 용</th>
		    <td colspan=3>
		    	<textarea cols="30" name="Content" rows="30" style="width: 90%; resize:none;" placeholder="내용을 작성해주세요 ex)제품 설명, 전화번호 or 카톡 ID.." ></textarea> 
		    </td>
		</tr>
		<tr>
			<th>가격</th>
			<td colspan="3">
		    	<input type="text" name="Price" style="width:90%" placeholder="판매 가격을 적어주세요"/>
		    </td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>                         
				<input type="file" name="img_src" placeholder="첨부파일 첨부"/>
			</td>
		</tr>
        </table>
        
	    <div class="bottom_btn" align="right" style="margin-right:10vw">
	    	<input id="submitBtn" type="submit" class="bt" value="등록"/>
	    </div>
        </form>
    </section>
    <% } %>
    <%@ include file="import/footer.jsp" %>
    