<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
<link rel="stylesheet" href="addInsurance.css"/>
</head>
<body>
	
	<%
		String pid = request.getParameter("pid");
		String url = "jdbc:mysql://localhost:3306/insurancedb";
		String user = "root", password = "admin123";
		String sql, message;
		String name="", time_period="", type="", description="", premium="", benefits="";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			Statement smt = con.createStatement();
			
			sql = "select * from policies where pid=" + pid;
			ResultSet rs = smt.executeQuery(sql);
	        if (rs.next()) {
	            name = rs.getString("name");
	            time_period = "" + rs.getInt("time_period");
	            type = rs.getString("type");
	            description = rs.getString("description");
	            premium = "" + rs.getDouble("premium");
	            benefits = rs.getString("benefits");
	        }
	        rs.close();
    		smt.close();
    		con.close();
		}catch(Exception ex){
			out.println(ex + " pid: " + pid);
		}
	%>
	
	<div class="top-row">
		<h1>Update Insurance</h1>
	</div>
	<div class="right-button">
		<a href="adminHome.jsp"><button class="button2">Cancel</button></a>
	</div>
	<div class="form-container">
	    <form action="updateInsuranceHandler.jsp?pid=<%= pid %>" method="POST">
	        <label for="name">Name:</label>
	        <input type="text" id="name" name="name" required value=<%= name %>>
	
	        <label for="time_period">Time Period (in months):</label>
	        <input type="number" id="time_period" name="time_period" required value=<%= time_period %>>
	
	        <label for="type">Type:</label>
	        <input type="text" id="type" name="type" required value=<%= type %>>
	
	        <label for="description">Description:</label>
	        <textarea id="description" name="description" rows="4" required ><%= description %></textarea>
	
	        <label for="premium">Premium:</label>
	        <input type="number" id="premium" name="premium" required value=<%= premium %>>
	
	        <label for="benefits">Benefits:</label>
	        <textarea id="benefits" name="benefits" rows="4" required ><%= benefits %></textarea>
	
	        <input type="submit" value="UPDATE">
	        
	    </form>
	    <div style="margin-top: 10px">
			<td><a href="deleteInsuranceHandler.jsp?pid=<%= pid %>" onclick="return confirmDelete();">
						<button class="button2" style="margin-left: 25%; width: 50%">DELETE</button>
				</a>
			</td>
			<script>
			    function confirmDelete() {
			        return confirm("Are you sure you want to delete this insurance record?");
			    }
			</script>	
		</div>
	</div>
	<footer class="footer">
    	<p>All rights reserved.</p>
	</footer>
	
</body>
</html>