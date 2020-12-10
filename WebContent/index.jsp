<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="market_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<jsp:useBean id="board_DAO" scope="page" class="com.webServer.freeBoardDAO"/>

<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<%
/* Session Check
	if((String)session.getAttribute("student_num") == null){
		out.print("<script>console.log('너는 손놈이다.')</script>");
	}else{
		out.print("<script>console.log('너는 : " +(String)session.getAttribute("student_num") + "이다.')</script>");
	}
*/
%>

<div class="img_section">
    <img id="mainimg" src="public/images/mainimg2.jpg" alt="LOGO"/>
    <div id="mainimg_text">
        <h1>호서나라</h1>
        호서대학교 학생들을 위한, 가장 가까운 중고마켓<br>
        <input type="button" value="더 알아보기&gt;&gt;" onclick="location.href='developerIndex.jsp'"/>
    </div>
</div>

<section class="board_section">
    <div id="market">
        <h3>거래 게시판</h3>
        <div id="card_container">
        
		<%
			int MAX_LIST_SIZE = 3;
			String db_data = market_DAO.getAllResult();
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
						
			for(int i=0; i<MAX_LIST_SIZE; i++){
				try{
					JSONObject element = (JSONObject)resultArr.get(i);
					String mid = (String)element.get("mid");
					String Title = (String)element.get("Title");
					String Price = (String)element.get("Price");
					String img_src = (String)element.get("img_src");
					String Writer = (String)element.get("Writer");
					String Date = (String)element.get("Date");
					String Date2 = (String)element.get("Date2");
		%>	
        <div class="card" onclick="location.href = 'marketDetail.jsp?mid=<%= mid %>'">
           <img style="width: 100%" src="public/images/<%=img_src%>"/>
           <%=Title%>
           <div class="card_footer">
       		<%=Writer%>
           </div>
        </div>
        <%}catch(Exception e){ continue; }}%>
        </div>
    </div>
    <div id="free">
        <h3>자유 게시판</h3>
        <table>
            <thead>
                <tr>
                   <th>순번</th> 
                   <th>제목</th>
                   <th>글쓴이</th>
                </tr>
            </thead>
            <tbody>
            
			<%
				int MAX_LIST_SIZE_FREE = 5;
				String db_data_FREE = board_DAO.getAllResult();
				JSONParser parser_FREE = new JSONParser();
				Object result_FREE = parser_FREE.parse(db_data_FREE);
				JSONArray resultArr_FREE = (JSONArray)result_FREE;
							
				for(int i=0; i<MAX_LIST_SIZE_FREE; i++){
					try{
						JSONObject element_FREE = (JSONObject)resultArr_FREE.get(i);
						String Num = (String)element_FREE.get("Num");
						String Title_FREE = (String)element_FREE.get("Title");
						String Writer_FREE = (String)element_FREE.get("Writer");
			%>	
            <tr onclick="location.href = 'freedetail.jsp?Num=<%= Num %>'">
	            <td><%=i+1%></td>
	            <td><%=Title_FREE%></td>
	            <td><%=Writer_FREE%></td>
            </tr>
        	<%}catch(Exception e){ continue; }}%>
            </tbody>
        </table>
    </div>
</section>
<%@ include file="import/footer.jsp" %>
