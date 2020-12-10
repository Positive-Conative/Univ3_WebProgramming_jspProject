<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage = "error.jsp"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%session.invalidate();  out.println("<script>alert('로그아웃 되었습니다!');location.href=\'index.jsp \' </script>"); %>
</body>
</html>