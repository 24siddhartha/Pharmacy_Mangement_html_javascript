package com.myproject.medical.servlets;

import com.myproject.medical.factory.Connector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String medicineId = request.getParameter("medicine_id");
        String medicineName = request.getParameter("medicine_name");
        String category = request.getParameter("category");
        String quantityStr = request.getParameter("quantity");
        String expiryDate = request.getParameter("expiry_date");
        String priceStr = request.getParameter("price");

        String message = "";
        
        try {
            int quantity = Integer.parseInt(quantityStr);
            double price = Double.parseDouble(priceStr);
            
            Connection conn = Connector.getCon();
            PreparedStatement stmt;

            if ("add".equals(action)) {
                stmt = conn.prepareStatement("INSERT INTO medicines (medicine_id, medicine_name, category, quantity, expiry_date, price) VALUES (?, ?, ?, ?, ?, ?)");
                stmt.setString(1, medicineId);
                stmt.setString(2, medicineName);
                stmt.setString(3, category);
                stmt.setInt(4, quantity);
                stmt.setString(5, expiryDate);
                stmt.setDouble(6, price);
            } else if ("update".equals(action)) {
                stmt = conn.prepareStatement("UPDATE medicines SET medicine_name=?, category=?, quantity=?, expiry_date=?, price=? WHERE medicine_id=?");
                stmt.setString(1, medicineName);
                stmt.setString(2, category);
                stmt.setInt(3, quantity);
                stmt.setString(4, expiryDate);
                stmt.setDouble(5, price);
                stmt.setString(6, medicineId);
            } else {
                stmt = conn.prepareStatement("DELETE FROM medicines WHERE medicine_id=?");
                stmt.setString(1, medicineId);
            }

            int rowsAffected = stmt.executeUpdate();
            message = (rowsAffected > 0) ? "Stock updated successfully!" : "Failed to update stock.";

            stmt.close();
            conn.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }

        response.sendRedirect("update_stock.jsp?message=" + message);
    }
}
