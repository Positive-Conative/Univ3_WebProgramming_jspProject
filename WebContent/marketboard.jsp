<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="market_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<body>
    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>거래 게시판</h1>
                		글 등록을 통해 거래를 하세요. 
            </div>
        </div>
       <div class="board">
              <div id="card_container">
        <%
			int pnum =  Integer.parseInt(request.getParameter("pnum"));
			int MAX_LIST_SIZE = 4;
			String db_data = market_DAO.getAllResult();
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
						
			for(int i=(pnum-1) * MAX_LIST_SIZE; i<pnum * MAX_LIST_SIZE; i++){
				try{
					JSONObject element = (JSONObject)resultArr.get(i);
					String mid = (String)element.get("mid");
					String Title = (String)element.get("Title");
					String Price = (String)element.get("Price");
					String img_src = (String)element.get("img_src");
					String Writer = (String)element.get("Writer");
					String Date = (String)element.get("Date");
		%>		
            <div class="card" onclick="location.href = 'marketDetail.jsp?mid=<%= mid %>'">
                <img src="public/images/mainimg1.jpg"/>
                <%=Title %><br>
                <%=Price %>원<br>
                 <%=Date %>
                <div class="card_footer">
                    <%=Writer %>
                </div>
            </div>
            <%}catch(Exception e){ continue; }}%>
        </div>
            
      </div><br>
      <div align="center">
         	<%if(pnum>1){%>
         		<input type="button" class="bt-toolbar" value="&lt; Priv" onclick="location.href='marketboard.jsp?pnum=<%= pnum-1%>'"/>
         	<%} %>
         	<% for(int i=1; i<(resultArr.size()/MAX_LIST_SIZE)+2; i++){%>
         		<input type="button" class="bt-toolbar" value="<%= i%>" onclick="location.href='marketboard.jsp?pnum=<%= i%>'"/>
         	<%}%>
         	<%if(pnum != (resultArr.size()/MAX_LIST_SIZE)+2){%>
         		<input type="button" class="bt-toolbar" value="Next &gt;" onclick="location.href='marketboard.jsp?pnum=<%= pnum+1%>'"/>
         	<%} %>
                            	
         </div><br><br><br>
            <div style="text-align: center;  ">
 
                   <%
						if((String)session.getAttribute("student_num") == null){
				
						}
						else{
							out.print("<input type=\"button\" class=\"bt\" value=\"글 작성하기\" onclick=\"location.href='marketBoardWrite.jsp'\"/>");				
						}
					%>
                          
            </div>
    </section>
  	
    
</body>