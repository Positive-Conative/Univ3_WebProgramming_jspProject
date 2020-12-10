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

    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>게시글 작성</h1>
                	자유로운 게시글을 작성해주세요
            </div>
        </div>

        <form  enctype="multipart/form-data" method="POST" action="marketBoardInsert.jsp">
        <input type="hidden" name="writer" />
        <table class="content">
		<tr>
		    <th>제목</th>
		    <td colspan="3">
		     	<input type="text" name="title" style="width:90%" placeholder="제목을 입력하세요"/>
		    </td>
		</tr>
		<tr>
		    <th>내용</th>
		    <td colspan=3>
		    	<textarea cols="30" name="Content" rows="30" style="width: 90%; resize:none;" >거래 시 주의사항! &#13;&#10;허구 사실을 기재 및 사기 적발 시 형사처벌을 받으실 수 있습니다!!!&#13;&#10; 1. 제품 설명 : &#13;&#10; 2. 연락 가능한 전화번호 입력 : &#13;&#10; 3. 추가 설명 :</textarea> 
		    </td>
		</tr>
		<tr>
			<th>희망 가격</th>
			<td colspan="3">
		    	<input type="text" name="Price" style="width:30%" placeholder="희망 판매 가격을 적어주세요"/>￦
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
    