<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
</head>
<body>
<h1 style="text-align:center">Admin Home</h1>
<%
	String message = (String) session.getAttribute("errorMessage");
	session.removeAttribute("errorMessage");
%>
<% if (message != null) { %>
    <p><strong>Message:</strong> <%= message %></p>
<% } %>
</body>
</html>