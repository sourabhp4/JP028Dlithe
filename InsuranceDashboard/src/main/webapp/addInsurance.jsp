<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
<link rel="stylesheet" href="addInsurance.css"/>
</head>
<body>
	<div class="top-row">
		<h1>Add Insurance</h1>
	</div>
	<div class="right-button">
		<a href="adminHome.jsp"><button class="button2">Cancel</button></a>
	</div>
	<div class="form-container">
	    <form action="addInsuranceHandler.jsp" method="POST">
	        <label for="name">Name:</label>
	        <input type="text" id="name" name="name" required>
	
	        <label for="time_period">Time Period (in months):</label>
	        <input type="number" id="time_period" name="time_period" required>
	
	        <label for="type">Type:</label>
	        <input type="text" id="type" name="type" required>
	
	        <label for="description">Description:</label>
	        <textarea id="description" name="description" rows="4" required></textarea>
	
	        <label for="premium">Premium:</label>
	        <input type="number" id="premium" name="premium" required>
	
	        <label for="benefits">Benefits:</label>
	        <textarea id="benefits" name="benefits" rows="4" required></textarea>
	
	        <input type="submit" value="Submit">
    	</form>
	</div>
	<footer class="footer">
    	<p>All rights reserved.</p>
	</footer>
</body>
</html>