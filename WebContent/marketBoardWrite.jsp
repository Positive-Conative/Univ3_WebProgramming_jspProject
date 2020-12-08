<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<%@include file="import/header.jsp" %>

<%
	if(	request.getParameter("Writer")!=null &&
		request.getParameter("Title")!=null && 
		request.getParameter("Content")!=null&&
		request.getParameter("Price")!=null){
		
		out.println("<script>alert('등록되었습니다.'); location.href='marketboard.jsp?pnum=1'</script>");
		marketBoard_DAO.inputmarketToDB(request.getParameter("Writer"),request.getParameter("Title"), request.getParameter("Content"),request.getParameter("Price"), "img_src");

	}
%>

<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>게시글 작성</h1>
                	자유로운 게시글을 작성해주세요
            </div>
        </div>
        <form method="post">
        <table class="content">
            <tbody>
                <tr>
                 
                    <td id="main_content">
                        <div>
                            	<table>
                                <tbody>
                                	<tr><h1>거 래  게  시  글  작  성</h1></tr>
                                	<tr>
                                       <th>작성자 ID</th>
                                       <td colspan="3">
                                            <input type="text" name="Writer" style="width:90%" placeholder="본인의 ID를 작성해주세요"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <th>제 목</th>
                                        <td colspan="3">
                                        	<input type="text" name="Title" style="width:90%" placeholder="제목을 작성해주세요"/>
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
                                </tbody>
                            </table>
                            <div class="bottom_btn" align="right" style="margin-right:10vw">
                            	<input id="submitBtn" type="submit" class="bt" value="등록"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </section>
    
