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

@WebServlet("/RemoveUserServlet")
public class RemoveUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");

        try {
            // Get database connection from Connector class
            Connection con = Connector.getCon();

            // Prepare SQL statement
            String query = "DELETE FROM appuser WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);

            int result = ps.executeUpdate();

            if (result > 0) {
                request.setAttribute("successMessage", "User removed successfully!");
            } else {
                request.setAttribute("errorMessage", "User not found. Please try again.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("remove_user.jsp");
            dispatcher.forward(request, response);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Unable to remove user.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("remove_user.jsp");
            dispatcher.forward(request, response);
        }
    }
}

