<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="notice_DAO" scope="page" class="com.webServer.serviceCenterDAO"/>
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
            <tbody>
                <tr>
                    <%@ include file="import/navi.jsp" %>
                    <td id="main_content">
                        <div>
                            <h1>Q & A</h1>
                            <table>
                                <thead>
                                    <tr>
                                       <th>순번</th> 
                                       <th>제목</th> 
                                       <th>글쓴이</th>
                                       <th>답변상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
									int pnum =  Integer.parseInt(request.getParameter("pnum"));
									int MAX_LIST_SIZE = 5;
									String db_data = notice_DAO.getQnaResults();
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
											String content = (String)element.get("content");
											String admin_coment = (String)element.get("admin_coment");
								%>
								<tr onclick="location.href='qnaDetail.jsp?qid=<%= qid %>'">
	                                <td><%= i+1 %></td>
	                                <td><%= title %></td>
	                                <td><%= writer %></td>
	                                <td>
	                                	<% if(admin_coment != null){ %>
	                                		<span style="color:blue">답변 완료</span>
	                                	<% }else{ %>
	                                		<span style="color:red">답변 대기</span>
	                                	<% } %>
	                                </td>
                                </tr>
								<%}catch(Exception e){ continue; }}%>
                                </tbody>
                            </table>
                            <br>
                            <div align="center">
                            	<%if(pnum>1){%>
                            		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='qna.jsp?pnum=<%= pnum-1%>'"/>
                            	<%} %>
                            	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
                            		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='qna.jsp?pnum=<%= i%>'"/>
                            	<%}%>
                            	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+1){%>
                            		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='qna.jsp?pnum=<%= pnum+1%>'"/>
                            	<%} %>
                            	
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="text-align: right; margin-right:15vw ">
            <%
			if((String)session.getAttribute("student_num") == null){
			
			}
			else{
				out.print("<input type=\"button\" class=\"bt\" value=\"글 작성하기\" onclick=\"location.href='qnaWrite.jsp'\"/>");				
			}
			%>
        </div>
    </section>
    
    <%@ include file="import/footer.jsp" %>