<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
<link rel="stylesheet" href="userHome.css"/>
</head>
<body>
	<div class="top-row">
		<%
			if(((String) session.getAttribute("username")) == null || !((String) session.getAttribute("userType")).equalsIgnoreCase("user")){
				session.setAttribute("errorMessage", "Login to proceed");
				response.sendRedirect("logout.jsp");
				return;
			}
			String message = (String) session.getAttribute("errorMessage");
			session.removeAttribute("errorMessage");
		%>
		<h1>User Home</h1>
		<% if (message != null) { %>
	    	<p class="msg" id="message"><strong class="msg">Message:</strong> <%= message %></p>
	    	<script>
		        setTimeout(function() {
		            document.getElementById("message").style.display = "none";
		        }, 3000);
		    </script>
	    	
		<% } %>
	</div>
	
	<div class="right-button">
		<a href="userSpecificInsurance.jsp"><button class="button1">Your Insurances</button></a>
		<a href="logout.jsp"><button class="button2">LOGOUT</button></a>
	</div>
	<table border="2">
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Premium</th>
			<th>View</th>
		</tr>
		<%
			String url = "jdbc:mysql://localhost:3306/insurancedb";
			String user = "root", password = "admin123";
			String sql = "select policies.pid, policies.name, policies.type, policies.premium from policies, user_policies where policies.pid != user_policies.pid";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, password);
				Statement smt = con.createStatement();
				ResultSet rs = smt.executeQuery(sql);
		        while (rs.next()) {%>
		            
		            <tr>
		            	<td><% out.print(rs.getString("name")); %></td>
		            	<td><% out.print(rs.getString("type")); %></td>
		            	<td><% out.print(rs.getString("premium")); %></td>
		            	<td><a href="viewInsuranceUser.jsp?pid=<%= rs.getInt("pid")%>" ><button class="button3">VIEW</button></a></td>
    						</a>
						</td>
		            </tr>
		            
		        <%}
		        rs.close();
	    		smt.close();
	    		con.close();
			}catch(Exception ex){
				session.setAttribute("errorMessage", ex);
				response.sendRedirect("logout.jsp");
			}
		%>
	</table>
	<footer class="footer">
    	<p>All rights reserved.</p>
	</footer>
</body>
</html>