<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<jsp:useBean id="serviceCenter_DAO" scope="page" class="com.webServer.serviceCenterDAO"/>
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
        <br><br>
		<%
			String db_data = serviceCenter_DAO.getOneQnaResult(request.getParameter("qid"));
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String qid = (String)element.get("qid");
			String title = (String)element.get("title");
			String writer = (String)element.get("writer");
			String content = (String)element.get("content");
			String admin_coment = (String)element.get("admin_coment");
			String date = (String)element.get("date");
			String admin_date = (String)element.get("admin_date");
			
			String name = user_infoDAO.get_name(writer);
			writer = writer + " (" + name + ")";
		%>
        <table align=center class="faqDetail">
            <tbody>
                <tr>
                    <th>글쓴이</th>
                    <td><%= writer %></td>
                    <th>작성 날짜</th>
                    <td><%= date %></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"> <%= title %> </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <%= content %>
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br>
        <table align=center class="qnaDetail_admin">
            <tbody>
                <tr>
                    <th>관리자 답변</th>
                    <% if(admin_coment != null){%>
                    	<td><%= admin_coment %></td>
	                    <th>답변 작성 날짜</th>
	                    <td><%= admin_date %></td>
                    <% }else{%> 
                    	<td colspan=3>답변이 입력되지 않았습니다.</td>
                    <% } %> 
                </tr>
            </tbody>
        </table>
        <br>
        <div style="text-align: right; margin-right:15vw ">
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>
    
    <%@ include file="import/footer.jsp" %>