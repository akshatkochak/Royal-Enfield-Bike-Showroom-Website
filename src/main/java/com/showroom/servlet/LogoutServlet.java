package com.showroom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/log-out")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try(PrintWriter out = response.getWriter())
		{
			if(request.getSession().getAttribute("auth") != null)
			{
				request.getSession().removeAttribute("auth");
				//out.println("<h3 style='color:crimson;text-align:center'>User Logout sucessfully <a href='login.jsp'>Go to Login Page</a></h3>");
				response.sendRedirect("login.jsp");
				
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
		}
	}

}
