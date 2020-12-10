<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
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
        <br><br>
		<%
			String db_data = notice_DAO.getOneResult(request.getParameter("nid"));
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String title = (String)element.get("title");
			String writer = (String)element.get("writer");
			String content = (String)element.get("content");
		%>
        <table align=center class="faqDetail">
            <tbody>
                <tr>
                    <th>글쓴이</th>
                    <td><%= writer %></td>
                    <th>조회수</th>
                    <td>15</td>
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
        <br>
        <div style="text-align: right; margin-right:15vw ">
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
    </section>
    
    <%@ include file="import/footer.jsp" %>