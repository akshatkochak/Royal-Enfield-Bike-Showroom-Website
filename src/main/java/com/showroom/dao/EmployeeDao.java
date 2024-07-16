package com.showroom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.showroom.model.Employee;

public class EmployeeDao 
{
	 public int registerEmployee(Employee employee) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO employee" +
	            "  (firstName, lastName, email, password, address, contact) VALUES " +
	            " ( ?, ?, ?, ?,?,?);";

	        int result = 0;

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/bike_showroom?useSSL=false", "root", "root");

	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	            preparedStatement.setString(1, employee.getFirstName());
	            preparedStatement.setString(2, employee.getLastName());
	            preparedStatement.setString(3, employee.getEmail());
	            preparedStatement.setString(4, employee.getPassword());
	            preparedStatement.setString(5, employee.getAddress());
	            preparedStatement.setString(6, employee.getContact());


	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	            e.printStackTrace(); 
	        }
	        return result;
	    }

}
