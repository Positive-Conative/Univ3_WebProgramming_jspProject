<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%session.removeAttribute("info_check");%>
<%session.removeAttribute("check_info");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%session.invalidate();  out.println("<script>alert('�α׾ƿ� �Ǿ����ϴ�!');location.href=\'index.jsp \' </script>"); %>
</body>
</html>