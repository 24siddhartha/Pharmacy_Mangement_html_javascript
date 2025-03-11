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

@WebServlet("/UpdateMedicineServlet")
public class UpdateMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String medicineId = request.getParameter("medicine_id");
        String medicineName = request.getParameter("medicine_name");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String expiryDate = request.getParameter("expiry_date");
        double price = Double.parseDouble(request.getParameter("price"));

        try (Connection con = Connector.getCon()) {
            String query = "UPDATE medicines SET medicine_name=?, category=?, quantity=?, expiry_date=?, price=? WHERE medicine_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, medicineName);
            ps.setString(2, category);
            ps.setInt(3, quantity);
            ps.setString(4, expiryDate);
            ps.setDouble(5, price);
            ps.setString(6, medicineId);

            int rows = ps.executeUpdate();
            response.sendRedirect("update_stock.jsp?status=" + (rows > 0 ? "success" : "error"));
        } catch (Exception e) {
            response.sendRedirect("update_stock.jsp?status=error");
        }
    }
}

