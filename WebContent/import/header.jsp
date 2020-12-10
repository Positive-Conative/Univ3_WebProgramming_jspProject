<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user_infoDAO" scope="page" class="com.webServer.user_infoDAO"/>
<jsp:useBean id="maktetBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="public/stylesheets/index.css" rel="stylesheet"/>
    <title>Hoseo World</title>
</head>
    <body>
        <header>
        	<div style="cursor:pointer;">
        		<img src="public/images/logo.PNG" onclick="location.href='index.jsp'"/>
        	</div>
            
            <nav>
                <li onclick="location.href='marketboard.jsp?pnum=1'">거래게시판</li>
                <li onclick="location.href='freeboard.jsp?pnum=1'">자유게시판</li>
                <li onclick="location.href='notice.jsp?pnum=1'">고객센터</li>
                <li onclick="location.href='developerIndex.jsp'">개발자 정보</li>
                <%
                	String authority = null;
                	if((String)session.getAttribute("student_num") != null){
                		authority = user_infoDAO.get_authority((String)session.getAttribute("student_num"));
                		if(authority.equals("1"))
                			out.print("<li style=\"color:blue\" onclick=\"location.href='adminQna.jsp?pnum=1'\">관리자</li>");
                	}
                %>
                <div class="navRight">
                	<form method=get action="search.jsp">
	                    <input type="hidden" name="pnum" value="1"/>
	                    <input type="text" name="search" placeholder="Search"/>
	                    <button class="bt" type="submit" style="width:25px;"><img src="public/images/loupe.png"></button>
						<%
							if((String)session.getAttribute("student_num") == null){
								out.print("<div id=\"loginbtn\" onclick=\"location.href='signin.jsp'\">LOG IN</div>");
							}else{
								if(!authority.equals("1"))
									out.print("<div style=\"margin-right: 10px\"id=\"loginbtn\" onclick=\"location.href='info_check.jsp'\">내 정보</div>");
								out.print("<div id=\"loginbtn\" onclick=\"location.href='signout.jsp'\">LOG OUT</div>");
							}
						%>
                	</form>
                </div>
            </nav>
            <img src="public/images/square.png" id="hbg" onclick="active_menubar()"/>
            <div id="hbg_menubar">
                <div id="mark_X" onclick="closeMenu()">x</div>
                <table id="menubar_table">
                    <tr onclick="location.href='marketboard.jsp?pnum=1'">
                        <td>거래게시판</td>
                    </tr>
                    <tr onclick="location.href='freeboard.jsp?pnum=1'">
                        <td>자유게시판</td>
                    </tr>
                    <tr onclick="location.href='notice.jsp?pnum=1'">
                        <td>고객센터</td>
                    </tr>
                    <tr onclick="location.href='developerIndex.jsp'">
		                <td>개발자 정보</td>
                    </tr>
                    <%
                    	if((String)session.getAttribute("student_num") != null){
                			if(authority.equals("1")){%>
	                			<tr onclick="location.href='adminQna.jsp?pnum=1'">
                        			<td>관리자</td>
                    			</tr>
                			<%}
                    	}
                	%>
                    <%
						if((String)session.getAttribute("student_num") == null){
							out.print("<tr><td onclick=\"location.href='signin.jsp'\">LOG IN</td></tr>");
						}else{
							if(!authority.equals("1"))
								out.print("<tr onclick=\"location.href='info_check.jsp'\"><td>내 정보</td></tr>");
							out.print("<tr onclick=\"location.href='signout.jsp'\"><td>LOG OUT</td></tr>");
							
						}
					%>
                </table>
                <div id="menubar_footer"><div>Hoseo World</div></div>
            </div>
        </header>
        
        <style>
        	#loginbtn{
        		display:inline-block;
        		cursor:pointer;
        	}
        	#loginbtn:hover{
        		color:red;
        	}
        </style>
		<script>
		      function active_menubar(){
		          document.getElementById('hbg_menubar').style.display='inline-block';
		          document.getElementById('hbg').style.display='none';
		      }
		      function closeMenu(){
		          document.getElementById('hbg').style.display='inline-block';
		          document.getElementById('hbg_menubar').style.display="none";
		      }
		      window.addEventListener('resize', (e)=>{
		          if(e.srcElement.innerWidth > 1000){
		              document.getElementById('hbg_menubar').style.display="none";
		              document.getElementById('hbg').style.display="none";
		          }else{
		              document.getElementById('hbg').style.display="inline-block";
		              document.getElementById('hbg_menubar').style.display="none";
		          }
		      })
		</script>