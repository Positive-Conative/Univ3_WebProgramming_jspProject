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
                            <h1>Q & A</h1>
                            <table>
                                <thead>
                                    <tr>
                                       <th>순번</th> 
                                       <th>제목</th> 
                                       <th>글쓴이</th>
                                       <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>글 쓰기 관련 공지사항입니다,..</td>
                                        <td>관리자</td>
                                        <td>15</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>거랙 관련 공지사항입니다,..</td>
                                        <td>관리자</td>
                                        <td>135</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>자고싶을 때의 공지사항입니다,..</td>
                                        <td>관리자</td>
                                        <td>11</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>더이상의 공지상은 없다..</td>
                                        <td>관리자</td>
                                        <td>10</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>더이상의 공지상은 없다..</td>
                                        <td>관리자</td>
                                        <td>10</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>더이상의 공지상은 없다..</td>
                                        <td>관리자</td>
                                        <td>10</td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>더이상의 공지상은 없다..</td>
                                        <td>관리자</td>
                                        <td>10</td>
                                    </tr>
                                    <tr>
                                        <td>8000</td>
                                        <td>더이상의 공지상은 없다..</td>
                                        <td>관리자</td>
                                        <td>10</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>