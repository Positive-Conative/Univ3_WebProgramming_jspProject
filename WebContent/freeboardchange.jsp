<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%session.removeAttribute("info_check");%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<jsp:useBean id="freeBoard_DAO" scope="page" class="com.webServer.freeBoardDAO"/>
<%@include file="import/header.jsp" %>

<%
	JSONObject result = new JSONObject(); 
	String board_num = new String();
	if((String)session.getAttribute("student_num") == null){
		out.print("<script>alert('로그인 후 이용할 수 있는 기능입니다.');</script>");
		out.print("<script>window.history.back()</script>");
	}
	else{
		String user_id = (String)session.getAttribute("student_num");
%>

<%
	if(request.getParameter("boardNum") == null){
		out.print("<script>window.history.back()</script>");
	}
	else{
		board_num = (String)request.getParameter("boardNum");
		
		
		result = freeBoard_DAO.get_content((String)request.getParameter("boardNum"));
	}
%>

<%
	if(	request.getParameter("Title")!=null && 
		request.getParameter("Content")!=null){
			out.println("<script>alert('수정되었습니다.'); location.href='freeboard.jsp?pnum=1'</script>");
			freeBoard_DAO.change_content(board_num, request.getParameter("Title"), request.getParameter("Content"));
	}
%>

<link href="public/stylesheets/board.css" rel="stylesheet"/>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>게시글 작성</h1>
                	자유로운 게시글을 작성해주세요
            </div>
        </div>
        <form method="post">
        	<input type="hidden" name="boardNum" value="<%= board_num %>" id="boardNum">
        <table class="content">
            <tbody>
                <tr>
                    <td id="main_content">
                        <div>                           
                            <table>
                                <tbody>
                                	<tr>
                                		<h1>자  유  게  시  글  작  성</h1>
                                	</tr>
                                	<tr>
                                       <th>작성자 ID</th>
                                       <td colspan="3">
                                             <div style="text-align: left; margin-left: 5%"><%= user_id %></div>
                                       </td>
                                    </tr>
                                    <tr>
                                        <th>제 목</th>
                                        <td colspan="3">
                                        	<input type="text" name="Title" style="width:90%" placeholder="제목을 작성해주세요" value="<%= result.get("2") %>"/>
                                        </td>
                                    </tr>	
                                    <tr>
                                        <th>내 용</th>
                                        <td colspan=3>
                                        	<textarea cols="30" name="Content" rows="25" style="width: 90%; resize:none;" placeholder="내용을 작성해주세요"><%= result.get("3") %></textarea> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="bottom_btn" align="right" style="margin-right:10vw">
                            	<input id="submitBtn" type="submit" class="bt" value="수정"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </section>
	<% } %>
    <%@ include file="import/footer.jsp" %>
  