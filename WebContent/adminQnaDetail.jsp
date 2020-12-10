<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ include file="import/header.jsp" %>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="serviceCenter_DAO" scope="page" class="com.webServer.serviceCenterDAO"/>
<jsp:useBean id="admin_DAO" scope="page" class="com.webServer.adminDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>

<%
	authority = null;
    if((String)session.getAttribute("student_num") != null){
    	authority = user_infoDAO.get_authority((String)session.getAttribute("student_num"));
		if(authority.equals("1")){
			
		}
		else{
			out.print("<script>window.history.back()</script>");
		}
    }
    else{
    	out.print("<script>window.history.back()</script>");
    }
%>


<%
	if(request.getParameter("admin_coment")!=null){
		
		out.println("<script>alert('등록되었습니다.'); location.href='adminQna.jsp?pnum=1'</script>");
		admin_DAO.inputQnaDB(request.getParameter("qid"),request.getParameter("admin_coment"));

	}
%>
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
        <form name="admin_coment_form" method=post>
	        <table align=center class="qnaDetail_admin">
	            <tbody>
	                <tr>
	                    <th>관리자 답변</th>
	                    <% if(admin_coment != null){%>
	                    	<td><%= admin_coment %></td>
		                    <th>답변 작성 날짜</th>
		                    <td><%= admin_date %></td>
	                    <% }else{%> 
	                    	<td colspan=3>
	                    		<textarea name="admin_coment" style="width:90%; height:90%; resize: none;" ></textarea></td>
	                    <% } %> 
	                </tr>
	            </tbody>
	        </table>

        <br>
        <div style="text-align: right; margin-right:15vw ">
        	<% if(admin_coment != null){%>
        		<input type="submit" class="bt" value="수정하기"/>
            <% }else{%> 
        		<input type="submit" class="bt" value="작성하기"/>
            <% } %>
            <input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
        </div>
        </form>
    </section>