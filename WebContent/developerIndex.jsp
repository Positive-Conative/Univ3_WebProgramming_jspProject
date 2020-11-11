<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
	

<section class="developer_section">
    <div class="card"  onclick="modal_show()">
        <h2>김영재 20161477</h2>
        <img src="public/images/KYJ.jpg"/><br>
        설명 ㅋㅋ
    </div>
    <div class="card" onclick="modal_show()">
        <h2>김동헌 20161471</h2>
        <img src="public/images/KDH.jpg"/><br>
        설명 ㅋㅋ
    </div>
    <div class="card" onclick="modal_show()">
        <h2>권순맨 20161468</h2>
        <img src="public/images/KSY.jpg"/><br>
        설명 ㅋㅋ
    </div>
    <!-- <img id="uitLogoArea" src="../image/uitlogo.PNG"/> -->
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
	function modal_show(){
	    document.getElementById('modal').style.display='block'
	}
	function modal_hide(){
	    document.getElementById('modal').style.display='none'
	}
</script>
<%@ include file="import/footer.jsp" %>