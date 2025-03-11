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

@WebServlet("/DeleteMedicineServlet")
public class DeleteMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String medicineId = request.getParameter("medicine_id");

        try (Connection con = Connector.getCon()) {
            String query = "DELETE FROM medicines WHERE medicine_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, medicineId);

            int rows = ps.executeUpdate();
            response.sendRedirect("update_stock.jsp?status=" + (rows > 0 ? "success" : "error"));
        } catch (Exception e) {
            response.sendRedirect("update_stock.jsp?status=error");
        }
    }
}
