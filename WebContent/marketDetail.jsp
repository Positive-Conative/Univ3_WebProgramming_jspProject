<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
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
      	<div align=center>
      		<h3>댓 글 작 성</h3>
      			<textarea cols="10" name="comment" rows="10" style="width:70%; resize:none;" placeholder="내용을 작성해주세요" ></textarea>
		</div>
       
        <br>
        <div style="text-align: right; margin-right:15vw ">
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>
    <%@ include file="import/footer.jsp" %>