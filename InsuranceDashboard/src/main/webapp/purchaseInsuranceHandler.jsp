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
	String nominee = request.getParameter("nominee");
	String start_date = request.getParameter("start-date");
	String end_date = request.getParameter("end-date");
	String premium = request.getParameter("premium");
	String status = "Active";
	String pid = request.getParameter("pid");
	
	String sql, message;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		Statement smt = con.createStatement();
		String email = (String) session.getAttribute("username");
		sql = "select * from users where email='" + session.getAttribute("username") + "'";
		
		ResultSet rs = smt.executeQuery(sql);
        if (!rs.next()) {
        	
        	String errorMessage = "Not Authorised!";
            session.setAttribute("errorMessage", errorMessage);
            response.sendRedirect("logout.jsp");
            return;
        }
        int uid = rs.getInt("uid");
        sql = "INSERT INTO user_policies (nominee, starting_date, ending_date, premium, status, pid, uid) VALUES ('" + nominee + "', '" + start_date + "', '" + end_date + "', " + premium + ", '" + status + "', " + pid + ", " + uid + ")";

        if (smt.executeUpdate(sql) != 0) {
    		smt.close();
    		con.close();
            message = "Purchase Successful...";
            session.setAttribute("errorMessage", message);
            response.sendRedirect("userHome.jsp");
        } else {
        	message = "Something went wrong, Try again...";
            session.setAttribute("errorMessage", message);
            response.sendRedirect("userHome.jsp");
        }
	}catch(Exception ex){
		out.println(ex);
	}
%>
</body>
</html>