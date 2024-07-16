<%@page import="com.showroom.connection.Dbcon"%>
<%@page import="com.showroom.dao.ProductDao"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.showroom.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf" , dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct =null;
if(cart_list !=null)
{
	
	ProductDao pDao = new ProductDao(Dbcon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total =pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("total",total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Book Ride</title>
<%@ include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td 
 {
	vartical-align:middle;
 }
 
 .btn-incre, .btn-decre
 {
 	box-shodow: none;
 	font-size:25px;
 }
</style>
</head>
<body>
	<%@ include file="includes/navbar.jsp"%>



	<div class="container">
		<div class="d-flex py-3">
			<h3>Booking a Test Ride</h3>
			<a class="mx-3 btn btn-primary" href="motorcycle.jsp">Add More</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Bike</th>
					<th scope="col">Colors</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%if(cart_list != null)	
			{
				for(Cart c:cartProduct)
				{%>
					<tr>
					<td><%= c.getBike() %></td>
					<td><%= c.getColors()%></td>
					<td><%= c.getPrice()%></td>
					<td><a class="btn btn-sm btn-outline-danger" href="remove-from-cart?id=<%= c.getId()%>">Remove</a></td>
					
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value=<%= c.getId() %> class="form-input">
							
						</form>
					</td>
				</tr>
				<% 	
				}
			}
			%>
				
			</tbody>
		</table>
	</div>


</body>
</html>