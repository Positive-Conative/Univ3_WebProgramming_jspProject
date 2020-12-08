<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import = "java.util.*" %>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>

<jsp:useBean id="freeBoard_DAO" scope="page" class="com.webServer.freeBoardDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
<%
	if(	request.getParameter("C_Writer")!=null &&
		request.getParameter("Comment")!=null){
		
		out.println("<script>alert('등록되었습니다.');</script>");
		freeBoard_DAO.inputcommentToDB(request.getParameter("C_Writer"),request.getParameter("Comment"));

	}
%>
<section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>자 유 게 시 판</h1>
                	자유로운 커뮤니케이션을 통해 대화를 하세요
            </div>
        </div>
        <br><br>
		<%
			String db_data = freeBoard_DAO.getOneFreeResults(request.getParameter("Num"));
			String comment_data = freeBoard_DAO.getCommentResult();
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			Object result2 = parser.parse(comment_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String Num= (String)element.get("Num");
			String Writer = (String)element.get("Writer");
			String Title = (String)element.get("Title");			
			String Content = (String)element.get("Content");
			String Date = (String)element.get("Date");
			String cid= (String)element.get("cid");
			String C_Writer = (String)element.get("C_Writer");
			String Comment = (String)element.get("Comment");
			
		%>
		
        <table align=center class="freeDetail">
            <tbody>            
                <tr>
                    <th>작성자</th>
                    <td><%= Writer %></td>
                    <th>작성 날짜</th>
                    <td><%= Date %></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"> <%= Title %> </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <%= Content %>
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br><br><br>
       
      	<form method="post">
      	<div align=center>
      		<h3>댓 글 작 성</h3> 
      		<table>
      		  <tbody>
      		 
      			<tr>
      				<th>
      					작성자
      				</th>
      				<td>
      					 <input type="text" name="C_Writer" style="width:90%" placeholder="본인의 ID를 작성해주세요"/>
      			    </td>
      		   </tr>
      				
      			 <tr>
      			 	<textarea cols="10" name="Comment" rows="10" style="width:70%; resize:none;" placeholder="내용을 작성해주세요" ></textarea><br>
      			 </tr>	
      				</tbody>	    
      			</table>
      		<input id="submitBtn" type="submit" class="bt" value="등록"/>		   		
		</div>
      	</form><br><br>
      	<table align=center class="commentDetail">
      		<tbody>
      			<tr>
      				<th>작성자</th>
      				
      				<td><%=C_Writer %></td>
      				<td><%=Comment %></td>
      			</tr>
      			
      		</tbody>
      	</table>
      	
        <br><br><br><br>
        <div style="text-align: right; margin-right:15vw ">
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>
