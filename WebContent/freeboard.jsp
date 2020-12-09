<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="board_DAO" scope="page" class="com.webServer.freeBoardDAO"/>

<link href="public/stylesheets/board.css" rel="stylesheet"/>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>자유 게시판</h1>
                자유로운 커뮤니케이션을 통해 대화를 하세요
                
            </div>
        </div>
		
        <table class="content">
            <tbody>
            
                <tr>
               
                    <td id="main_content">
                        <div>
                            <h1>자 유 게 시 판</h1>
                            <table>
                                <thead id="thead">
                                    <tr>
                                       <th>순번</th> 
                                       <th>제목</th> 
                                       <th>작성자</th>         
                                    </tr>
                                </thead>
                                <tbody>
									<%
										int pnum =  Integer.parseInt(request.getParameter("pnum"));
										int MAX_LIST_SIZE = 5;
										String db_data = board_DAO.getAllResult();
										JSONParser parser = new JSONParser();
										Object result = parser.parse(db_data);
										JSONArray resultArr = (JSONArray)result;
										
										//out.print(b);
										//out.print(resultArr.size());
										
										for(int i=(pnum-1) * MAX_LIST_SIZE; i<pnum * MAX_LIST_SIZE; i++){
											try{
												JSONObject element = (JSONObject)resultArr.get(i);
												String Num = (String)element.get("Num");
												String Title = (String)element.get("Title");
												String Writer = (String)element.get("Writer");
												String Contetnt = (String)element.get("Content");
										%>
										<tr onclick="location.href = 'freedetail.jsp?Num=<%= Num %>'">
	                                        <td><%= i+1 %></td>
	                                        <td><%= Title %></td>
	                                        <td><%= Writer %></td>   
                                    	</tr>
										<%}catch(Exception e){ continue; }}%>
                                </tbody>
        					</table>
        					<div align="center">
                            	<%if(pnum>1){%>
                            		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='freeboard.jsp?pnum=<%= pnum-1%>'"/>
                            	<%} %>
                            	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
                            		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='freeboard.jsp?pnum=<%= i%>'"/>
                            	<%}%>
                            	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+1){%>
                            		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='freeboard.jsp?pnum=<%= pnum+1%>'"/>
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
				out.print("<input type=\"button\" class=\"bt\" value=\"글 작성하기\" onclick=\"location.href='freeboardwrite.jsp'\"/>");				
			}
			%>
        </div>
    </section>
<%@ include file="import/footer.jsp" %>
