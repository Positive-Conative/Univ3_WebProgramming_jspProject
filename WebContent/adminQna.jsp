<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%session.removeAttribute("info_check");%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="admin_DAO" scope="page" class="com.webServer.adminDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>

<%
	authority = null;
    if((String)session.getAttribute("student_num") != null){
    	authority = user_infoDAO.get_authority((String)session.getAttribute("student_num"));
		if(authority.equals("1")){
			
		}
		else{
			out.print("<script>window.history.back()</script>");
		}
    }
    else{
    	out.print("<script>window.history.back()</script>");
    }
%>

    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>관리자 페이지</h1>
                관리자 전용 페이지입니다.
            </div>
        </div>
        <table class="content">
            <tbody>
                <tr>
					<th id="navi" valign="top">
					    <div>
					        <li onclick="location.href='adminQna.jsp?pnum=1'">Q&A 답변</li>
					        <li onclick="location.href='adminReport.jsp?pnum=1'">신고 처리</li>
					    </div>
					</th>
                    <td id="main_content">
                        <div>
                            <h1>미 완 료 된  Q & A (오래된순)</h1>
                            <table>
                                <thead>
                                    <tr>
                                       <th>순번</th> 
                                       <th>제목</th> 
                                       <th>글쓴이</th>
                                       <th>작성날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
									int pnum =  Integer.parseInt(request.getParameter("pnum"));
									int MAX_LIST_SIZE = 5;
									String db_data = admin_DAO.qnaComment();
									JSONParser parser = new JSONParser();
									Object result = parser.parse(db_data);
									JSONArray resultArr = (JSONArray)result;
									
									//out.print(b);
									//out.print(resultArr.size());
									
									for(int i=(pnum-1) * MAX_LIST_SIZE; i<pnum * MAX_LIST_SIZE; i++){
										try{
											JSONObject element = (JSONObject)resultArr.get(i);
											String qid = (String)element.get("qid");
											String title = (String)element.get("title");
											String writer = (String)element.get("writer");
											String date = (String)element.get("date");
								%>
								<tr onclick="location.href='adminQnaDetail.jsp?qid=<%= qid %>'">
	                                <td><%= i+1 %></td>
	                                <td><%= title %></td>
	                                <td><%= writer %></td>
	                                <td><%= date %></td>
                                </tr>
								<%}catch(Exception e){ continue; }}%>
                                </tbody>
                            </table>
                            <br>
                            <div align="center">
                            	<%if(pnum>1){%>
                            		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='adminQna.jsp?pnum=<%= pnum-1%>'"/>
                            	<%} %>
                            	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
                            		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='adminQna.jsp?pnum=<%= i%>'"/>
                            	<%}%>
                            	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+1){%>
                            		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='adminQna.jsp?pnum=<%= pnum+1%>'"/>
                            	<%} %>
                            	
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>