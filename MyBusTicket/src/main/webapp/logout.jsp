<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% HttpSession hs=request.getSession(false);
hs.invalidate();
RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
rd.forward(request, response); %>

</body>
</html>