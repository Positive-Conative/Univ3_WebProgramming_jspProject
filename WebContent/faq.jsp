<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="import/header.jsp" %>
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
    <table class="content">
        <tbody>
            <tr>
                <%@ include file="import/navi.jsp" %>
                <td id="main_content">
                    <div>
                        <h1>F A Q</h1>
                        <table>
                            <thead>
                                <tr>
                                   <th>순번</th> 
                                   <th>제목</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="faq_title" onclick="show('faq_contents1')">
                                    <td>1</td>
                                    <td>글을 쓰려면 어떻게 해야하나요?</td>
                                </tr>
                                <tr id="faq_contents1" class="fc"> 
                                    <td> </td>
                                    <td colspan="2">↳&nbsp;글쓰기 버튼을 누르시면 됩니다!</td>
                                </tr>
                                <tr id="faq_title" onclick="show('faq_contents2')">
                                    <td>2</td>
                                    <td>글을 지우려면 어떻게 해야하나요?</td>
                                </tr>
                                <tr id="faq_contents2" class="fc"> 
                                    <td> </td>
                                    <td colspan="2">┖&nbsp;지우기 버튼을 누르시면 됩니다!</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</section>

<script>
    let showMap = new Map();
    function show(ev){
        console.log(document.getElementById(ev));
        if(showMap.get(ev)){
            document.getElementById(ev).style.display= "none";
            showMap.delete(ev);
        }else{
            document.getElementById(ev).style.display= "table-row";
            document.getElementById(ev).style.color= "red";
            document.getElementById(ev).style.border= "0";
            document.getElementById(ev).setAttribute('colspan', 2);
            showMap.set(ev, true);
        }
    }
</script>
<style>
    .fc{
        display:none;
    }
</style>
