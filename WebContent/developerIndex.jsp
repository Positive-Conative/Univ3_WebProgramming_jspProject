<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%@ include file="import/header.jsp" %>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="serviceCenter_DAO" scope="page" class="com.webServer.serviceCenterDAO"/>


<section class="developer_section">
    <h1>개발자 정보</h1>
    <%
		String db_data = serviceCenter_DAO.getDevelopers();
		JSONParser parser = new JSONParser();
		Object result = parser.parse(db_data);
		JSONArray resultArr = (JSONArray)result;
		
		//out.print(b);
		//out.print(resultArr.size());
		
		for(int i=0; i<3; i++){
			try{
				JSONObject element = (JSONObject)resultArr.get(i);
				String name = (String)element.get("name");
				String age = (String)element.get("age");
				String student_num = (String)element.get("student_num");
				String target = (String)element.get("target");
				String hobby = (String)element.get("hobby");
				String Technology_Available = (String)element.get("Technology_Available");
				String interesting = (String)element.get("interesting");
				String note = (String)element.get("note");
				String img_src = (String)element.get("img_src");
		%>
		<div class="card">
	        <h2><%= name %> <%= student_num %></h2>
	        <img src="public/images/<%=img_src%>"/><br>
	        <input class="bt" type="button" value="Detail >>" onclick="modal_show(<%= i %>)"/>
    	</div>
		<div id="modal<%= i %>" class="modal">
		    <span class="content">
		    	<div id="modal_Xbtn" onclick="modal_hide(<%= i %>)">&nbsp;X&nbsp;</div>
		        <h3>개발자 정보</h3>
		        <table>
		            <tbody>
		                <tr>
		                    <th>이름</th>
		                    <td><%= name %></td>
		                    <th>학번</th>
		                    <td><%= student_num %></td>
		                </tr>
		                <tr>
		                    <th>취업 희망 분야</th>
		                    <td colspan=3><%= target %></td>
		                </tr>
		                <tr>
		                    <th>사용 가능 기술</th>
		                    <td colspan=3><%= Technology_Available %></td>
		                </tr>
		                <tr>
		                    <th>최근 흥미 분야</th>
		                    <td colspan=3><%= interesting %></td>
		                </tr>
		                <tr>
		                    <th>한 마디</th>
		                    <td colspan=3><%= note %></td>
		                </tr>
		            </tbody>
		        </table>
		    </span>
		</div>
		<%}catch(Exception e){ continue; }}%>

    
    
    <!-- <img id="uitLogoArea" src="../image/uitlogo.PNG"/> -->
</section>

<section class="development_language">
    <h1>제작 언어 및 사용 기술</h1><br>
    <div class="logos">
    	<img src="public/images/html_logo.webp" width=170px	height=170px/>
    	<img src="public/images/css_logo.png" />
    	<img src="public/images/javascript_logo.png"/><br>
    	<img src="public/images/mysql_logo.png" width=154px	height=120px/>
    	<img src="public/images/java_logo.png" width=200px height=150px/>
    	<img src="public/images/tomcat_logo.png" width=160px height=140px/>
    </div>
</section>



<script>
	function modal_show(idval){
	    document.getElementById('modal'+idval).style.display='block'
	}
	function modal_hide(idval){
	    document.getElementById('modal'+idval).style.display='none'
	}
</script>
<%@ include file="import/footer.jsp" %>