<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
	

<section class="developer_section">
    <h1>개발자 정보</h1>
    <div id="kyj" class="card">
        <h2>김영재 20161477</h2>
        <img src="public/images/KYJ.jpg"/><br>
        <input class="bt" type="button" value="Detail >>" onclick="modal_show('kyj')"/>
    </div>
    <div id="kdh" class="card">
        <h2>김동헌 20161471</h2>
        <img src="public/images/KDH.jpg"/><br>
        <input class="bt" type="button" value="Detail >>" onclick="modal_show('kdh')"/>
    </div>
    <div id="ksy" class="card">
        <h2>권순영 20161468</h2>
        <img src="public/images/KSY.png"/><br>
        <input class="bt" type="button" value="Detail >>" onclick="modal_show('ksy')"/>
    </div>
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

<div id="modal">
    <span class="content">
        <h3>20161477 김영재</h3>
        <table>
            <thead>
                <tr>
                   <th>이름</th> 
                   <td>김영재</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>이름</th>
                    <td>자유게시판 공지입니다.</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>자유게시판 공지입니다.</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>자유게시판 공지입니다.</td>
                </tr>
            </tbody>
        </table>
        <br><br><br><input type="button" value="X" onclick="modal_hide()"/>
    </span>
</div>

<script>
	function modal_show(idval){
	    document.getElementById('modal').style.display='block'
	}
	function modal_hide(){
	    document.getElementById('modal').style.display='none'
	}
</script>
<%@ include file="import/footer.jsp" %>