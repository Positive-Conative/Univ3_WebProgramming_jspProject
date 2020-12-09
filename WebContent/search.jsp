<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>

<%
	String db_data = marketBoard_DAO.getSearchData(request.getParameter("search"));
%>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>고객센터</h1>
                고객님의 크고 작은 목소리를 들려주세요. <br> 
                작은 소리는 무시하겠습니다.(?)
            </div>
        </div>
		
        <table class="content">
                <tr>
                    <%@ include file="import/navi.jsp" %>
                    <td id="main_content">
                        <div>
                            <h1>검 색 결 과</h1>
                            <table>
                                <thead>
                                    <tr>
                                       <th>순번</th> 
                                       <th>이미지</th> 
                                       <th>제목</th> 
                                       <th>글쓴이</th>
                                       <!--  <th>조회수</th> -->
                                    </tr>
                                </thead>
                                <tbody>
									<%
										int pnum =  Integer.parseInt(request.getParameter("pnum"));
										int MAX_LIST_SIZE = 5;
										JSONParser parser = new JSONParser();
										Object result = parser.parse(db_data);
										JSONArray resultArr = (JSONArray)result;
										
										//out.print(b);
										//out.print(resultArr.size());
										
										for(int i=(pnum-1) * MAX_LIST_SIZE; i<pnum * MAX_LIST_SIZE; i++){
											try{
												JSONObject element = (JSONObject)resultArr.get(i);
												out.println((String)element.get("Title"));
												String mid = (String)element.get("mid");
												String Writer = (String)element.get("Writer");
												String Title = (String)element.get("Title");
												String Content = (String)element.get("Content");
												String Price = (String)element.get("Price");
												String Date = (String)element.get("Date");
												String img_src = (String)element.get("img_src");
										%>
										<tr onclick="location.href='marketDetail.jsp?mid=<%= mid %>'">
	                                        <td><%= i+1 %></td>
	                                        <td><img src="public/images/<%=img_src%>"/></td>
	                                        <td><%= Writer %></td>
	                                        <td><%= Title %></td>
                                    	</tr>
										<%}catch(Exception e){ continue; }}%>
                                </tbody>
                            </table>
                            <br>
                            <div align="center">
                            	<%if(pnum>1){%>
                            		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='search.jsp?pnum=<%= pnum-1%>&search=<%=request.getParameter("search")%>'"/>
                            	<%} %>
                            	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
                            		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='search.jsp?pnum=<%= i%>&search=<%=request.getParameter("search")%>'"/>
                            	<%}%>
                            	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+1){%>
                            		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='search.jsp?pnum=<%= pnum+1%>&search=<%=request.getParameter("search")%>'"/>
                            	<%} %>
                            </div>
                        </div>
                    </td>
                </tr>
        </table>
    </section>
    <style>
    </style>