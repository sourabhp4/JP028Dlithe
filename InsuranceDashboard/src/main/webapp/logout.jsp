<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
</head>
<body>
<%
	try{
		if(session.getAttribute("errorMessage") == null){
			session.setAttribute("message", "Logout Successful");
			session.removeAttribute("username");
			session.removeAttribute("userType");
			response.sendRedirect("index.jsp");
			return;
		}
			
		if(((String) session.getAttribute("errorMessage").toString()) == null || (String) session.getAttribute("errorMessage").toString() == ""){
			session.setAttribute("message", "Logout Successful");
		}
		session.removeAttribute("username");
		session.removeAttribute("userType");
		response.sendRedirect("index.jsp");
	}catch(Exception e){
		out.print(e);
	}
%>
</body>
</html>