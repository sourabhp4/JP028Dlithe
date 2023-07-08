<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
<link rel="stylesheet" href="adminHome.css"/>
</head>
<body>
	<div class="top-row">
		<%
			if(((String) session.getAttribute("username")) == null || !((String) session.getAttribute("userType")).equalsIgnoreCase("admin")){
				session.setAttribute("errorMessage", "Login to proceed");
				response.sendRedirect("logout.jsp");
				return;
			}
			String message = (String) session.getAttribute("errorMessage");
			session.removeAttribute("errorMessage");
		%>
		<h1>Admin Home</h1>
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
		<a href="addInsurance.jsp"><button class="button1">ADD Insurance</button></a>
		<a href="logout.jsp"><button class="button2">LOGOUT</button></a>
	</div>
	<table border="2">
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Premium</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<%
			String url = "jdbc:mysql://localhost:3306/insurancedb";
			String user = "root", password = "admin123";
			String sql = "select * from policies";
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
		            	<td><a href="viewInsuranceAdmin.jsp?pid=<%= rs.getInt("pid")%>" ><button class="button3">VIEW</button></a></td>
		            	<td><a href="updateInsurance.jsp?pid=<%= rs.getInt("pid")%>" ><button class="button3">UPDATE</button></a></td>
		            	<td><a href="deleteInsuranceHandler.jsp?pid=<%= rs.getInt("pid") %>" onclick="return confirmDelete();">
 								<button class="button4">DELETE</button>
    						</a>
						</td>
						<script>
						    function confirmDelete() {
						        return confirm("Are you sure you want to delete this insurance record?");
						    }
						</script>
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