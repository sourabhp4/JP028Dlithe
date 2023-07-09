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
		<h1>DashBoard</h1>
	</div>
	
	<div class="right-button">
		<a href="userHome.jsp"><button class="button2">BACK</button></a>
	</div>
	<table border="2">
		<tr>
			<th>Name</th>
			<th>Date of Purchase</th>
			<th>Nominee</th>
			<th>Starting Date</th>
			<th>Ending Date</th>
			<th>Premium</th>
			<th>Status</th>
			<th>View</th>
		</tr>
		<%
			String url = "jdbc:mysql://localhost:3306/insurancedb";
			String user = "root", password = "admin123";
			String sql;;
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, password);
				Statement smt = con.createStatement();
				
				sql = "select * from users where email='" + session.getAttribute("username") + "'";
				
				ResultSet rs = smt.executeQuery(sql);
		        if (!rs.next()) {
		        	
		        	String errorMessage = "Not Authorised!";
		            session.setAttribute("errorMessage", errorMessage);
		            response.sendRedirect("logout.jsp");
		            return;
		        }
		        int uid = rs.getInt("uid");
				
				sql = "select policies.pid, policies.name, user_policies.date_of_purchase, user_policies.nominee, user_policies.starting_date, user_policies.ending_date, user_policies.premium, user_policies.status from policies, user_policies where user_policies.uid=" + uid +" and user_policies.pid = policies.pid";
				rs = smt.executeQuery(sql);
		        while (rs.next()) {%>
		            
		            <tr>
		            	<td><% out.print(rs.getString("name")); %></td>
		            	<td><% out.print(rs.getString("date_of_purchase")); %></td>
		            	<td><% out.print(rs.getString("nominee")); %></td>
		            	<td><% out.print(rs.getString("starting_date")); %></td>
		            	<td><% out.print(rs.getString("ending_date")); %></td>
		            	<td><% out.print(rs.getString("premium")); %></td>
		            	<td><% out.print(rs.getString("status")); %></td>
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