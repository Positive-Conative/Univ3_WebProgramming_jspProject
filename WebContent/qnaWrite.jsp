<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%session.removeAttribute("info_check");%>
<jsp:useBean id="serviceCenterDAO" scope="page" class="com.webServer.serviceCenterDAO"/>
<jsp:useBean id="report_DO" scope="page" class="com.webServer.reportDO"/>
<jsp:setProperty name="report_DO" property="*"/>

<%

	if((String)session.getAttribute("student_num") == null){
		out.print("<script>alert('로그인 후 이용할 수 있는 기능입니다.');</script>");
		out.print("<script>window.history.back()</script>");
	}
	else{
		String user_id = (String)session.getAttribute("student_num");
		String time = serviceCenterDAO.get_time();
%>

<%
	if( request.getParameter("content")!=null &&
		request.getParameter("title")!=null){
		
		serviceCenterDAO.inputQnaToDB(user_id,request.getParameter("title"), request.getParameter("content"));
		out.println("<script>alert('등록되었습니다.'); location.href='qna.jsp?pnum=1'</script>");
	}
%>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>신고하기</h1>
                고객님의 크고 작은 목소리를 들려주세요. <br> 
                작은 소리는 무시하겠습니다.(?)
            </div>
        </div>
        <form method="post" >
        <table class="content">
            <tbody>
                <tr>
                    <%@ include file="import/navi.jsp" %>
                    <td id="main_content">
                        <div>
                            <h1>Q & A 작 성</h1>
                            <table>
                                <tbody>
                                	<tr>
                                       <th>작성 ID<br></th>
                                       <th><%= user_id %></th> 
                                       <th>현재 시간<br></th>
                                       <th>
                                      		<%= time %>
                                       </th>
                                    </tr>
                                    <tr>
                                        <th>제 목</th>
                                        <td colspan="3">
                                        	<input type="text" name="title" style="width:90%" placeholder="제목을 작성해주세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내 용</th>
                                        <td colspan=3>
                                        	<textarea cols="30" name="content" rows="15" style="width: 90%; resize:none;" placeholder="내용을 작성해주세요" ></textarea> 
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
    
    <script>
    </script>
<% 
	}
%>

<%@ include file="import/footer.jsp" %>