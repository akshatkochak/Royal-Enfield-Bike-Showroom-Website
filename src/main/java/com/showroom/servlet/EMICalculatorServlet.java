package com.showroom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/emi_calculate")
public class EMICalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double bikePrice = Double.parseDouble(request.getParameter("bikePrice"));
        int month = Integer.parseInt(request.getParameter("month"));
        double rate = Double.parseDouble(request.getParameter("rate"));

        double monthlyInterestRate = rate / 100 / 12;
        double emi = (bikePrice * monthlyInterestRate) /
                     (1 - Math.pow(1 + monthlyInterestRate, -month));

        saveEMIToDatabase(bikePrice, month, rate, emi);

        PrintWriter out = response.getWriter();
        out.println("<h2>EMI Calculation Result</h2>");
        out.println("<p>Bike Price: $" + bikePrice + "</p>");
		out.println("<p>Loan Term: " + month + " months</p>");
        out.println("<p>Interest Rate: " + rate + "%</p>");
        out.println("<p>EMI: $" + emi + "</p>");
        
        System.out.print(emi);
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String emi1= decimalFormat.format(emi);

        
        request.setAttribute("bikePrice", bikePrice);
        request.setAttribute("month", month);
        request.setAttribute("rate", rate);
        request.setAttribute("emi", emi1);

        // Forward the request to create.jsp
        request.getRequestDispatcher("emi.jsp").forward(request, response);
        
    }

    private void saveEMIToDatabase(double bikePrice, int month, double rate, double emi) {
        // Replace the database connection details with your own
        String jdbcUrl = "jdbc:mysql://localhost:3306/bike_showroom";
        String username = "root";
        String password = "root";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            String query = "INSERT INTO emicalculation (bikePrice, month, rate, emi) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setDouble(1, bikePrice);
                preparedStatement.setInt(2, month);
                preparedStatement.setDouble(3, rate);
                preparedStatement.setDouble(4, emi);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    

}
