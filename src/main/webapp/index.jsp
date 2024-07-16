<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="com.showroom.connection.Dbcon"%>
<%@ page import="com.showroom.dao.ProductDao"%>
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
ProductDao pd = new ProductDao(Dbcon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Royal Enfield</title>
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

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="project-images/three/bikes.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="project-images/three/image.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="project-images/three/continental GT 650.jpg" alt="Third slide">
			</div>
	<!-- 	</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>  -->
	
	<!-- Motorcycle page code -->
	
<div class="container">
		<div class="card-header my-3">All Available Bikes</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
				%>
			<div class="col-md-12 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="project-images/royal/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getBike() %></h5>
						<h6 class="price">Price: <%=p.getPrice() %></h6>
						<h6 class="category">Colors: <%=p.getColors() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Test Ride</a> 
							
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

	<%@ include file="includes/footeer.jsp"%>

</body>
</html>