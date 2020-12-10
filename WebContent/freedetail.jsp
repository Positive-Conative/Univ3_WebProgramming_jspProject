<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import = "java.util.*" %>
<%@ include file="import/header.jsp" %>
<%session.removeAttribute("info_check");%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>

<jsp:useBean id="freeBoard_DAO" scope="page" class="com.webServer.freeBoardDAO"/>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<%
	String user_id = null;

	if((String)session.getAttribute("student_num") != null){
		user_id = (String)session.getAttribute("student_num");
	}
	if(	request.getParameter("Comments")!=null 
		){
		String NumVal=request.getParameter("Num");
		out.println("<script>alert('등록되었습니다.');location.href='freedetail.jsp?"+NumVal+"</script>");
		freeBoard_DAO.inputcommentToDB(user_id,request.getParameter("Num"),request.getParameter("Comments"));

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
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String Num= (String)element.get("Num");
			String Writer = (String)element.get("Writer");
			String Title = (String)element.get("Title");			
			String Content = (String)element.get("Content");
			String Date = (String)element.get("Date");
		%>
		<%
			/*String comment_data = freeBoard_DAO.getOneCommentResults(request.getParameter("Num"));
			JSONParser parser1 = new JSONParser();
			Object result1 = parser1.parse(comment_data);
			JSONArray resultArr1 = (JSONArray)result1;
			JSONObject element1 = (JSONObject)resultArr1.get(0);
			String cid= (String)element.get("cid");
			String board_num = (String)element.get("board_num");
			String C_Writer = (String)element.get("C_Writer");			
			String Comment = (String)element.get("Comment");
			String C_Date = (String)element.get("C_Date");*/
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
      	<%
				if((String)session.getAttribute("student_num") == null){
				}
				else{%>
				       
      	<form method="post">
      	<div align=center>
      		<h3>댓 글 작 성</h3> 
      		<table>
      		  <tbody>
      			 <tr>
      			 	<textarea cols="10" name="Comments" rows="10" style="width:70%; resize:none;" placeholder="내용을 작성해주세요" ></textarea><br>
      			 </tr>	
      				</tbody>	    
      			</table>
      		<input id="submitBtn" type="submit" class="bt" value="등록"/>		   		
		</div>
      	</form><br><br><%}
		%>
      	<table align=center class="commentDetail">
      		<tbody>
                <%
					String comment_data = freeBoard_DAO.getOneCommentResults(request.getParameter("Num"));
					JSONParser parser1 = new JSONParser();
					Object result1 = parser1.parse(comment_data);
					JSONArray resultArr1 = (JSONArray)result1;
					
					//out.print(b);
					//out.print(resultArr.size());
					for(int i=0; i<resultArr1.size(); i++){
						try{
							JSONObject element1 = (JSONObject)resultArr1.get(i);
							String cid= (String)element1.get("cid");
							String C_Writer = (String)element1.get("C_Writer");			
							String Comment = (String)element1.get("Comment");
							String C_Date = (String)element1.get("C_DATE");
				%>
				<tr >
                             <td><%= C_Writer %></td>
                             <td><%= Comment %></td>
                             <td><%= C_Date %></td>
                      </tr>
				<%}catch(Exception e){ continue; }}%>
      		</tbody>
      	</table>
      	
        <br><br><br><br>
        <div style="text-align: right; margin-right:15vw ">
        	<%
            	if(Writer.equals(user_id)){
           	%>
            		<form action="deleteBoard.jsp" method="POST" style="display: inline;" id="formdata">
            			<input type="submit" class="bt" value="수정하기"/>
            		</form>
            		<form method="POST" style="display: inline;" id="frmData" name="frmData">
            			<input type="hidden" name="boardType" value="free" id="boardType">
            			<input type="hidden" name="boardNum" value="<%= Num %>" id="boardNum">
            		</form>
            		<a href="#" onclick="openPop()"><button class="bt">삭제하기</button></a>
            <%
            	}
            %>	
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>

<script>
function openPop(){
    var pop_title = "popupOpener" ;
     
    window.open("deleteBoard.jsp", pop_title, "width=240, height=240") ;
     
    var frmData = document.frmData ;
    frmData.target = pop_title ;
    frmData.action = "deleteBoard.jsp" ;
     
    frmData.submit() ;
}

</script>
