<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
<link rel="stylesheet" href="login.css"/>
</head>
<%
	String errorMessage = (String) session.getAttribute("errorMessage");
	session.removeAttribute("errorMessage");
%>
<body>
	<div class="container">
		<h2>Sign Up Form</h2>
	    <form method="post" action="signUpHandler.jsp">
	      <div class="form-group">
	        <label for="name">Name:</label>
	        <input type="text" id="name" name="name" required>
	      </div>
	      <div class="form-group">
	        <label for="username">Email:</label>
	        <input type="text" id="username" name="email" required>
	      </div>
	      <div class="form-group">
	        <label for="password">Password:</label>
	        <input type="password" id="password" name="password" required>
	      </div>
	      <div class="form-group">
	        <label for="rePassword">Confirm Password:</label>
	        <input type="password" id="rePassword" name="rePassword" required>
	      </div>
	      <div class="form-group">
	        <input type="submit" value="Register" class="submit-btn">
	      </div>
	      <div style="text-align: center;">
	      	<p>Already a user? <a href="index.jsp">Click here</a></p>
	      </div>
	      <div>
	      	<% if (errorMessage != null) { %>
		    <p style="color: red"><strong>Error:</strong> <%= errorMessage %></p>
		  	<% } %>
	      </div>
	    </form>
    </div>
</body>
</html>
