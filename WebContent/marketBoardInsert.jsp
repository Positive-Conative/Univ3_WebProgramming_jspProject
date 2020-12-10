<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="marketBoard_DAO" scope="page" class="com.webServer.marketBoardDAO"/>
<%

	if((String)session.getAttribute("student_num") == null){
		out.print("<script>alert('로그인 후 이용할 수 있는 기능입니다.');</script>");
		out.print("<script>window.history.back()</script>");
	}
	else{
		String user_id = (String)session.getAttribute("student_num");
%>

<%
    // 파일이 저장되는 경로
    String path = request.getSession().getServletContext().getRealPath("public/images");
	//String path = request.getRealPath("/..");
	
    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

    // 실제로 파일 업로드하는 과정
    try{
        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

    	out.println("<script>alert('"+path+"')</script>");
    	out.println("<script>alert('dd')</script>");
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

        out.println("<script>alert('등록되었습니다.'); location.href='marketboard.jsp?pnum=1'</script>");
		marketBoard_DAO.inputmarketToDB(user_id, multi.getParameter("title"), multi.getParameter("Content"),multi.getParameter("Price"), file);
    } catch (Exception e) {
        e.printStackTrace();
    }
	}
%>