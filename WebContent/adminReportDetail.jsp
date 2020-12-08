<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<jsp:useBean id="admin_DAO" scope="page" class="com.webServer.adminDAO"/>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>
<%
	if(request.getParameter("penalty_rdo")!=null){
		out.println("<script>alert('적용되었습니다.'); location.href='adminReport.jsp?pnum=1'</script>");
		//admin_DAO.inputUserDB("20161472", 14, 1);
		admin_DAO.inputUserDB(request.getParameter("accused_id"),Integer.parseInt(request.getParameter("penalty_rdo")),Integer.parseInt(request.getParameter("rid")));

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
			String db_data = admin_DAO.getOneReport(request.getParameter("rid"));
			JSONParser parser = new JSONParser();
			Object result = parser.parse(db_data);
			JSONArray resultArr = (JSONArray)result;
			JSONObject element = (JSONObject)resultArr.get(0);
			String rid = (String)element.get("rid");
			String reporter_id = (String)element.get("reporter_id");
			String accused_id = (String)element.get("accused_id");
			String title = (String)element.get("title");
			String content = (String)element.get("content");
			String write_date = (String)element.get("write_date");
			
		%>
        <table align=center class="faqDetail">
            <tbody>
                <tr>
                	<th>신고자 ID<br><small>(신고하는 자)</small></th>
                    <th><%= reporter_id %></th>
                    <th rowspan=2>신고 날짜<br></th>
                    <th rowspan=2><%= write_date %></th>
                </tr>
                <tr>
                    <th>피신고자 ID<br><small>(신고받는 자)</small></th>
                    <th><%= accused_id %></th> 
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
        <form id="penalty_form" method=post>
        <input type='hidden' name='accused_id' value='<%=accused_id %>'>
        <input type='hidden' name='rid' value='<%=rid %>'>
	        <div style="text-align: right; margin-right:15vw ">
	        	<div id="penalty_list" style="display:none; ">
		        	<input type="radio" name="penalty_rdo" value="0"/>무죄 &nbsp;
		        	<input type="radio" name="penalty_rdo" value="7"/>7일 &nbsp;
		        	<input type="radio" name="penalty_rdo" value="14"/>14일 &nbsp;
		        	<input type="radio" name="penalty_rdo" value="30"/>30일 &nbsp;
	        	</div>
	        	<input type="button" class="bt" value="제제 리스트" id="penalty_btn" onclick="showPenaltyList()"/>
	        	<input type="submit" class="bt" value="제제 결정" id="penalty_send" style="display:none;background-color:red; color:white" onclick="decisionPenalty()"/>
	        	<input type="button" class="bt" value="뒤로가기" onclick="history.back()"/>
	        </div>
        </form>
        
    </section>
    
    <script>
    	function showPenaltyList(){
    		document.getElementById('penalty_list').style.display='inline-block';
    		document.getElementById('penalty_send').style.display='inline-block';
    		document.getElementById('penalty_btn').style.display='none';
		}
    	function decisionPenalty(){
    		var p_rdo = document.getElementsByName("penalty_rdo");
	        
    		for(var i=0; i<p_rdo.length; i++){
    			if(p_rdo[i].checked)
    				console.log(p_rdo[i].value);
    		}
    	}
    	
    </script>