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
	String errorMessage="", message="";
	try{
		if (session.getAttribute("errorMessage") != null) {
	        errorMessage = session.getAttribute("errorMessage").toString();
	    } else {
	        errorMessage = "";
	    }
	    
	    if (session.getAttribute("message") != null) {
	        message = session.getAttribute("message").toString();
	    } else {
	        message = "";
	    }
		session.removeAttribute("errorMessage");
		session.removeAttribute("message");
	}catch(Exception e){
		out.print(e);
	}
%>
<body>
	<div class="container">
		<h2>Sign In Form</h2>
	    <form method="post" action="loginHandler.jsp">
	      <div class="form-group">
	        <label for="username">Username:</label>
	        <input type="text" id="username" name="username" required>
	      </div>
	      <div class="form-group">
	        <label for="password">Password:</label>
	        <input type="password" id="password" name="password" required>
	      </div>
	      <div class="form-group">
	        <label class="role-label" for="role">Type:</label>
	        <select id="role" name="role" class="role-dropdown">
	          <option value="admin">Admin</option>
	          <option value="user">User</option>
	        </select>
	      </div>
	      <div class="form-group">
	        <input type="submit" value="Submit" class="submit-btn">
	      </div>
	      <div style="text-align: center;">
	      	<p>New User? <a href="signUp.jsp">Click here</a></p>
	      </div>
	      <div>
	      	<% if (errorMessage != null && !errorMessage.equals("")) { %>
		    <p style="color: red"><strong>Error:</strong> <%= errorMessage %></p>
		  	<% }%>
	      </div>
	      <% if (message != null && !message.equals("")) { %>
	      	<div>
		    	<p style="color: green"><strong>Message:</strong> <%= message %></p>
	      	</div>
		  <% }%>
	    </form>
    </div>
</body>
</html>
