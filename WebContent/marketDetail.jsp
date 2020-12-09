<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<%
	String user_id = null;

	if((String)session.getAttribute("student_num") != null){
		user_id = (String)session.getAttribute("student_num");
	}
	if(	request.getParameter("M_Comment")!=null 
		){
		String NumVal=request.getParameter("mid");
		out.println("<script>alert('등록되었습니다.');location.href='marketDetail.jsp?"+NumVal+"</script>");
		marketBoard_DAO.inputcommentToDB(user_id,request.getParameter("mid"),request.getParameter("M_Comment"));

	}
%>
<section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>거 래 게 시 판</h1>
                	글 등록을 통해 거래를 하세요. 
            </div>
        </div>
        <br><br>
		<%
		String db_data = marketBoard_DAO.getOneMarketResults(request.getParameter("mid"));
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String Num= (String)element.get("mid");
			String Writer = (String)element.get("Writer");
			String Title = (String)element.get("Title");			
			String Content = (String)element.get("Content");
			String Price = (String)element.get("Price");
			String Date = (String)element.get("Date");
			String img_src = (String)element.get("img_src");

			
		%>
        <table align=center class="marketDetail">
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
                	<th>가격</th>
                	<td colspan="3"><%=Price %>원</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                    	<%=img_src %><br>
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
      			 	<textarea cols="10" name="M_Comments" rows="10" style="width:70%; resize:none;" placeholder="내용을 작성해주세요" ></textarea><br>
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
					String comment_data = marketBoard_DAO.getOneCommentResults(request.getParameter("mid"));
					JSONParser parser1 = new JSONParser();
					Object result1 = parser1.parse(comment_data);
					JSONArray resultArr1 = (JSONArray)result1;
					
					//out.print(b);
					//out.print(resultArr.size());
					
					for(int i=0; i<resultArr1.size(); i++){
						try{
							JSONObject element1 = (JSONObject)resultArr1.get(i);
							String m_cid= (String)element1.get("m_cid");
							String M_Writer = (String)element1.get("M_Writer");			
							String M_Comment = (String)element1.get("M_Comment");
							String M_Date = (String)element1.get("M_Date");
				%>
				<tr >
                             <td><%= M_Writer %></td>
                             <td><%= M_Comment %></td>
                             <td><%= M_Date %></td>
                      </tr>
				<%}catch(Exception e){ continue; }}%>
      		</tbody>
      	</table>
        <br>
        <div style="text-align: right; margin-right:15vw ">
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>
    <%@ include file="import/footer.jsp" %>