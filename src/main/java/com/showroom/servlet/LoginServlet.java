package com.showroom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showroom.connection.Dbcon;
import com.showroom.dao.UserDao;
import com.showroom.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			try 
			{
				UserDao udao = new UserDao(Dbcon.getConnection());
				User user = udao.userLogin(email, password);
				
				if(user !=null)
				{
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("index.jsp");
				}
				else 
				{
					out.println("<h3 style='color:crimson;text-align:center'>User Login Failed<a href='login.jsp'>Go to Login Page</a></h3>");
				}
			}
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			}

		}
	}

}
