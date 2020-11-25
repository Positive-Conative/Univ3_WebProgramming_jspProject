<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
<%
	//DatabaseManager dm = new DatabaseManager();
	//String a = dm.LoadTest();
	//JSONParser parser = new JSONParser();
	//Object o = parser.parse(a);
	//JSONArray ja = (JSONArray)o;
	//JSONObject element = (JSONObject)ja.get(1);
	//String b = (String)element.get("title");
	//out.print(b);
%>
<link href="public/stylesheets/serviceCenter.css" rel="stylesheet"/>


    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>신고하기</h1>
                고객님의 크고 작은 목소리를 들려주세요. <br> 
                작은 소리는 무시하겠습니다.(?)
            </div>
        </div>
        <table class="content">
            <tbody>
                <tr>
                    <%@ include file="import/navi.jsp" %>
                    <td id="main_content">
                        <div>
                            <h1>신 고 하 기</h1>
                            <table>
                                <thead>
                                    
                                </thead>
                                <tbody>
                                	<tr>
                                       <th>신고자 ID<br><small>(신고하는 자)</small></th>
                                       <th>Conative's</th> 
                                       <th>피신고자 ID<br><small>(신고받는 자)</small></th>
                                       <th>
                                      		<input type="text" style="width:80%" placeholder="신고하려는 사람의 ID를 작성"/>
                                       </th>
                                    </tr>
                                    <tr>
                                        <th>제 목</th>
                                        <td colspan="3">
                                        	<input type="text" style="width:90%" placeholder="제목을 작성해주세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내 용</th>
                                        <td colspan=3>
                                        	<textarea cols="30" rows="15" style="width: 90%; resize:none;" placeholder="내용을 작성해주세요" ></textarea> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="bottom_btn" align="right" style="margin-right:10vw">
                            	<input type="button" class="bt" value="hello"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>