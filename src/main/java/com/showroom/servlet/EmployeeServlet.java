package com.showroom.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showroom.dao.EmployeeDao;
import com.showroom.model.Employee;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/employee-servlett")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EmployeeDao employeeDao = new EmployeeDao();
;    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String firstName = request.getParameter("firstName");
		String lastName =  request.getParameter("lastName");
		String email =  request.getParameter("email");
		String password =  request.getParameter("password");
		String address =  request.getParameter("address");
		String contact =  request.getParameter("contact");
		
		Employee employee = new Employee();
		 employee.setFirstName(firstName);
		 employee.setLastName(lastName);
		 employee.setemail(email);
		 employee.setAddress(address);
		 employee.setPassword(password);
		 employee.setContact(contact);
		 
		 System.out.println(firstName);
		 System.out.println(lastName);
		 System.out.println(email);
		 System.out.println(address);
		 System.out.println(password);
		 System.out.println(contact);

		 
		 try 
		{
			employeeDao.registerEmployee(employee);
		}
		 catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
			response.sendRedirect("index.jsp");

	}
}
