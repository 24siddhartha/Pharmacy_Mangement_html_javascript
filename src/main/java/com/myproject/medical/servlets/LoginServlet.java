package com.myproject.medical.servlets;

import com.myproject.medical.factory.Connector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            // Get database connection from another Java file
            Connection con = Connector.getCon();
            
            // Prepare SQL statement
            String query = "SELECT userRole FROM appuser WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String userRole = rs.getString("userRole"); // Assuming 'userRole' column exists
                
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userRole", userRole);
                
                // Redirect based on user role
                if ("admin".equalsIgnoreCase(userRole)) {
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    response.sendRedirect("pharmacist_dashboard.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
                dispatcher.forward(request, response);
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error connecting to the database.</h2>");
        }
    }
}


