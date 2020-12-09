<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="public/stylesheets/board.css" rel="stylesheet"/>
<%@page import="com.webServer.DatabaseManager"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<%@include file="import/header.jsp" %>


<%  
	if(	request.getParameter("Writer")!=null &&
		request.getParameter("Title")!=null && 
		request.getParameter("Content")!=null&&
		request.getParameter("Price")!=null){
		
		out.println("<script>alert('등록되었습니다.'); location.href='marketboard.jsp?pnum=1'</script>");
		marketBoard_DAO.inputmarketToDB(request.getParameter("Writer"),request.getParameter("Title"), request.getParameter("Content"),request.getParameter("Price"), "img_src");

	}
%>
<%
    // request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    String uploadPath = request.getRealPath("public/images");
    
    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
     
    String fileName1 ="";// 중복처리된 이름
    String originalName1 ="";// 중복 처리전 실제 원본 이름
    long fileSize =0;// 파일 사이즈
    String fileType ="";// 파일 타입
     
    MultipartRequest multi =null;
     
    try{
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
        // 전송한 전체 파일이름들을 가져옴
        Enumeration files = multi.getFileNames();
         
        while(files.hasMoreElements()){
            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
            // 그에 해당하는 실재 파일 이름을 가져옴
            originalName1 = multi.getOriginalFileName(file1);
            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
            fileName1 = multi.getFilesystemName(file1);
            // 파일 타입 정보를 가져옴
            fileType = multi.getContentType(file1);
            // input file name에 해당하는 실재 파일을 가져옴
            File file = multi.getFile(file1);
            // 그 파일 객체의 크기를 알아냄
            fileSize = file.length();
        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>


    <section class="SCcontent">
        <div class="imgarea">
            <img src="public/images/mainimg1.jpg">
            <div class="img_text">
                <h1>게시글 작성</h1>
                	자유로운 게시글을 작성해주세요
            </div>
        </div>
        <form method="post">
        <table class="content">
            <tbody>
                <tr>
                 
                    <td id="main_content">
                        <div>
                            	<table>
                                <tbody>
                                	<tr><h1>거 래  게  시  글  작  성</h1></tr>
                                	<tr>
                                       <th>작성자 ID</th>
                                       <td colspan="3">
                                            <input type="text" name="Writer" style="width:90%" placeholder="본인의 ID를 작성해주세요"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <th>제 목</th>
                                        <td colspan="3">
                                        	<input type="text" name="Title" style="width:90%" placeholder="제목을 작성해주세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내 용</th>
                                        <td colspan=3>
                                        	<textarea cols="30" name="Content" rows="30" style="width: 90%; resize:none;" placeholder="내용을 작성해주세요 ex)제품 설명, 전화번호 or 카톡 ID.." ></textarea> 
                                        </td>
                                    </tr>
                                    <tr>
                                    	<th>가격</th>
                                    	<td colspan="3">
                                        	<input type="text" name="Price" style="width:90%" placeholder="판매 가격을 적어주세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<th>첨부파일</th>
                                    	<td>                         
                                    		<input type="file" name="img_src" placeholder="첨부파일 첨부"/>
                                    	
                                    	</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="bottom_btn" align="right" style="margin-right:10vw">
                            	<input id="submitBtn" type="submit" class="bt" value="등록"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </section>
    
