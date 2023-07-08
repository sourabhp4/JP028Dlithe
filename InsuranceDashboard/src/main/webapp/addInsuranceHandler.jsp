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
	String url = "jdbc:mysql://localhost:3306/insurancedb";
	String user = "root", password = "admin123";
	String name = request.getParameter("name");
	String time_period = request.getParameter("time_period");
	String type = request.getParameter("type");
	String description = request.getParameter("description");
	String premium = request.getParameter("premium");
	String benefits = request.getParameter("benefits");
	
	String sql, message;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		Statement smt = con.createStatement();
		
	    sql ="insert into policies(name, time_period, type, description, premium, benefits, admin_id) values ('" + name + "'," + time_period + ",'" + type + "','" + description + "'," + premium + ",'" + benefits + "'," + 1 + ")";
        if (smt.executeUpdate(sql) != 0) {
    		smt.close();
    		con.close();
            message = "Insurance added...";
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