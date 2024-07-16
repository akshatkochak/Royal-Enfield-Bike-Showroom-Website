<%@ page import="com.showroom.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.showroom.model.*"%>
    
    <%User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    	request.setAttribute("auth", auth);
    } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="responsive.css">
    <title>Bike EMI Calculator</title>
      <%@ include file="includes/head.jsp"%>
    
</head>
<body>
	<%@ include file="includes/navbar.jsp"%>

    <div class="container">
        <h1>Bike EMI Calculator</h1>
        <form action="emi_calculate" method="post">
            <label for="bikePrice">Bike Price:</label>
            <input type="number" id="bikePrice" name="bikePrice" required>
            
            <label for="month">Loan Term (months):</label>
            <input type="number" id="month" name="month" required>
            
            <label for="rate">Interest Rate (%):</label>
            <input type="decimals" id="rate" name="rate" required>
            
             <button type="submit">Calculate EMI</button>
            
        </form>

        <div id="result"></div>

        </div>
	<%@ include file="includes/footeer.jsp"%>
        
</body>
</html>
