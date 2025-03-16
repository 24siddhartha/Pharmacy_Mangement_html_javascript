package com.myproject.medical.servlets;

import com.myproject.medical.factory.Connector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String userRole = request.getParameter("userRole");
        String name = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String mobileNumber = request.getParameter("mobile");
        String email = request.getParameter("email");
        String username = request.getParameter("newUsername");
        String password = request.getParameter("newPassword");
        String address = request.getParameter("address");

        try {
            // Get database connection from Connector class
            Connection con = Connector.getCon();
            
            // Prepare SQL statement
            String query = "INSERT INTO appuser (userRole, name, dob, mobileNumber, email, username, password, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userRole);
            ps.setString(2, name);
            ps.setString(3, dob);
            ps.setString(4, mobileNumber);
            ps.setString(5, email);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setString(8, address);

            int result = ps.executeUpdate();
            
            if (result > 0) {
                request.setAttribute("successMessage", "User added successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to add user. Please try again.");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("add_user.jsp");
            dispatcher.forward(request, response);
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Unable to add user.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("add_user.jsp");
            dispatcher.forward(request, response);
        }
    }
}

