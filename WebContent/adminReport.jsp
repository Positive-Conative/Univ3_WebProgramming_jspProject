<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="admin_DAO" scope="page" class="com.webServer.adminDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
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
                            <h1>신 고 목 록</h1>
                            <table>
                                <thead>
                                    <tr>
                                       <th>순번</th> 
                                       <th>글쓴이</th> 
                                       <th>제목</th>
                                       <th>작성날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
									int pnum =  Integer.parseInt(request.getParameter("pnum"));
									int MAX_LIST_SIZE = 5;
									String db_data = admin_DAO.getReport();
									JSONParser parser = new JSONParser();
									Object result = parser.parse(db_data);
									JSONArray resultArr = (JSONArray)result;
									
									//out.print(b);
									//out.print(resultArr.size());
									
									for(int i=(pnum-1) * MAX_LIST_SIZE; i<pnum * MAX_LIST_SIZE; i++){
										try{
											JSONObject element = (JSONObject)resultArr.get(i);
											String rid = (String)element.get("rid");
											String reporter_id = (String)element.get("reporter_id");
											String title = (String)element.get("title");
											String write_date = (String)element.get("write_date");
								%>
								<tr onclick="location.href='adminReportDetail.jsp?rid=<%= rid %>'">
	                                <td><%= i+1 %></td>
	                                <td><%= reporter_id %></td>
	                                <td><%= title %></td>
	                                <td><%= write_date %></td>
                                </tr>
								<%}catch(Exception e){ continue; }}%>
                                </tbody>
                            </table>
                            <br>
                            <div align="center">
                            	<%if(pnum>1){%>
                            		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='adminReport.jsp?pnum=<%= pnum-1%>'"/>
                            	<%} %>
                            	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
                            		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='adminReport.jsp?pnum=<%= i%>'"/>
                            	<%}%>
                            	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+1){%>
                            		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='adminReport.jsp?pnum=<%= pnum+1%>'"/>
                            	<%} %>
                            	
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>