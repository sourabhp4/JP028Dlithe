<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
</head>
<body>
	<%
		String pid = request.getParameter("pid");
		String url = "jdbc:mysql://localhost:3306/insurancedb";
		String user = "root", password = "admin123";
		
		String sql, message;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			Statement smt = con.createStatement();
			
			sql = "DELETE FROM policies WHERE pid = " + pid;


	        if (smt.executeUpdate(sql) != 0) {
	    		smt.close();
	    		con.close();
	            message = "Data deleted...";
	            session.setAttribute("errorMessage", message);
	            response.sendRedirect("adminHome.jsp");
	        } else {
	        	message = "Something went wrong, Try again...";
	            session.setAttribute("errorMessage", message);
	            response.sendRedirect("adminHome.jsp");
	        }
		}catch(Exception ex){
			out.println(ex);
		}
	%>
</body>
</html>