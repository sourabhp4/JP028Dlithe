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
	String emailID = request.getParameter("email");
	String pwd = request.getParameter("password");
	String rePass = request.getParameter("rePassword");
	String name = request.getParameter("name");
	
	if(! pwd.equals(rePass)){
		String errorMessage = "Both passwords should match";
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect("signUp.jsp");
        return;
	}
	
	String sql, errorMessage;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		Statement smt = con.createStatement();
		
		sql = "select * from users where email='" + emailID + "'";
		ResultSet rs = smt.executeQuery(sql);
	    if (rs.next()) {
	        errorMessage = "Already found an account";
	        session.setAttribute("errorMessage", errorMessage);
	        response.sendRedirect("signUp.jsp");
		    rs.close();
			smt.close();
			con.close();
	        return;
	    }
		
	    sql ="insert into users(email, name, password) values ('" + emailID + "','" + name + "','" + pwd + "')";
        if (smt.executeUpdate(sql) != 0) {
    		smt.close();
    		con.close();
            errorMessage = "Registration Successful...";
            session.setAttribute("message", errorMessage);
            response.sendRedirect("index.jsp");
        } else {
        	errorMessage = "Something went wrong, Try again...";
            session.setAttribute("errorMessage", errorMessage);
            response.sendRedirect("signUp.jsp");
        }
	}catch(Exception ex){
		out.println(ex);
	}

%>
</body>
</html>