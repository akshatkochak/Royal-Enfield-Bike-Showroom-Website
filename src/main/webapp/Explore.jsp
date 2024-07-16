<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.showroom.connection.Dbcon"%>
<%@ page import="com.showroom.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
   	User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null)
    {
    	request.setAttribute("auth",auth);
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
<title>Explore page</title>
<%@ include file="includes/head.jsp"%>
</head>
<body>
 <%@ include file="includes/navbar.jsp"%>
 <div class="col-6 col-md-2 mb-3">
        <h5>Motorcycles</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="bike1.jsp" class="nav-link p-0 text-muted">Continental GT 650</a></li>
          <li class="nav-item mb-2"><a href="bike3.jsp" class="nav-link p-0 text-muted">Classic 350</a></li>
          <li class="nav-item mb-2"><a href="bike9.jsp" class="nav-link p-0 text-muted">Himalayan 450</a></li>
          <li class="nav-item mb-2"><a href="bike7.jsp" class="nav-link p-0 text-muted">Interceptor 650</a></li>
          <li class="nav-item mb-2"><a href="bike6.jsp" class="nav-link p-0 text-muted">Scram 411</a></li>
          <li class="nav-item mb-2"><a href="bike5.jsp" class="nav-link p-0 text-muted">Meteor 350</a></li>
          <li class="nav-item mb-2"><a href="bike4.jsp" class="nav-link p-0 text-muted">Hunter 350</a></li>
          <li class="nav-item mb-2"><a href="bike2.jsp" class="nav-link p-0 text-muted">Bullet 350</a></li>
          <li class="nav-item mb-2"><a href="bike8.jsp" class="nav-link p-0 text-muted">Super Meteor 350</a></li>
        </ul>
      </div>
 
</body>
</html>