<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<%
	String user_id = null;

	if((String)session.getAttribute("student_num") != null){
		user_id = (String)session.getAttribute("student_num");
	}
	if(	request.getParameter("M_Comment")!=null ){
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
		<%
			String name = user_infoDAO.get_name(Writer);
			Writer = Writer + " (" + name + ")";
		%>
        <img src="public/images/<%=img_src%>" style="width:80%;margin-bottom:3rem;"/>
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
                	<th>희망 가격</th>
                	<td colspan="3"><%=Price %>원</td>
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
      			 	<textarea cols="10" name="M_Comment" rows="10" style="width:70%; resize:none;" placeholder="내용을 작성해주세요" ></textarea><br>
      			 </tr>	
      				</tbody>	    
      			</table>
      		<input id="submitBtn" type="submit" class="bt" value="등록"/>		   		
		</div>
      	</form><br><br><%}
		%>
       	<table align=center class="commentDetail" border=1 style="border-collapse: collapse;width:80%">
       		<thead style="background-color:lightgray">
       			<tr>
       				<th width="20%">학번</th>
       				<th width="60%">내용</th>
       				<th width="20%">작성일자</th>
       			</tr>
       		</thead>
      		<tbody>
                <%
					String comment_data = marketBoard_DAO.getOneCommentResults(request.getParameter("mid"));
					JSONParser parser1 = new JSONParser();
					Object result1 = parser1.parse(comment_data);
					JSONArray resultArr1 = (JSONArray)result1;
					
					//out.print(b);
					//out.print(resultArr.size());
					if(resultArr1.size()==0)
						out.println("<tr><td colspan=3>작성된 댓글이 존재하지 않습니다!</td></tr>");
					else if(resultArr1.size()!=0)
					for(int i=0; i<resultArr1.size(); i++){
						try{
							JSONObject element1 = (JSONObject)resultArr1.get(i);
							String m_cid= (String)element1.get("m_cid");
							String M_Writer = (String)element1.get("M_Writer");			
							String M_Comment = (String)element1.get("M_Comment");
							String M_Date = (String)element1.get("M_Date");
							
							name = user_infoDAO.get_name(M_Writer);
							M_Writer = M_Writer + " (" + name + ")";
				%>
				<tr>
	                <td><%= M_Writer %></td>
	                <td><%= M_Comment %></td>
	                <td><%= M_Date %></td>
                </tr>
				<%}catch(Exception e){ continue; }}%>
      		</tbody>
      	</table>
		<br>
        <div style="text-align: right; margin-right:15vw ">
        <%
            	if(Writer.equals(user_id)){
           	%>
            		<form action="marketBoardchange.jsp" method="POST" style="display: inline;" id="formdata">
            			<input type="hidden" name="boardNum" value="<%= Num %>" id="boardNum">
            			<input type="submit" class="bt" value="수정하기"/>
            		</form>
            		<form method="POST" style="display: inline;" id="frmData" name="frmData">
            			<input type="hidden" name="boardType" value="market" id="boardType">
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
    <%@ include file="import/footer.jsp" %>