<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.showroom.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
	 <%
   	User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null)
    {
    	response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list !=null)
    {
    	request.setAttribute("cart_list",cart_list);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Register Page</title>
<%@ include file="includes/head.jsp"%>
</head>
<body>
     <%@ include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center"> User Register</div>
			<div class="card-body">
			<form action="employee-servlett" method="post">
				<div class="form-group">
						<label> First Name </label> <input type="name"
							class="form-control" name="firstName"
							placeholder="Enter you First Name" required>
					</div>
				
				<div class="form-group">
						<label> Last Name </label> <input type="name"
							class="form-control" name="lastName"
							placeholder="Enter your Last Name" required>
					</div>
				
				<div class="form-group">
						<label> Email Address</label> <input type="email"
							class="form-control" name="email"
							placeholder="Enter your Email" required>
					</div>
				

					<div class="form-group">
						<label> Password </label> <input type="password"
							class="form-control" name="password"
							placeholder="--*******--" required>
					</div>

					<div class="form-group">
						<label> Address </label> <input type="address"
							class="form-control" name="address"
							placeholder="Enter your Address" required>
					</div>
					
					<div class="form-group">
						<label> Contact </label> <input type="Number"
							class="form-control" name="contact"
							placeholder="Enter your Phone Number" required>
					</div>
					

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
						<!-- <a href="login.jsp" class="btn btn-primary">Login page</a> -->
					</div>
					
				</form>
				<p>Already have to register?<a href="user-login">Login here</a></p>
			</div>
		</div>
	</div>
	<%@ include file="includes/footer.jsp"%>
</body>
</html>