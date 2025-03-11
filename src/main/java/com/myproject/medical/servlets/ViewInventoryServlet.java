package com.myproject.medical.servlets;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.inventory.utils.DatabaseConnection;
import com.myproject.medical.factory.Connector;

@WebServlet("/ViewInventoryServlet")
public class ViewInventoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try (Connection con = Connector.getCon();
             PreparedStatement stmt = con.prepareStatement("SELECT medicine_id, medicine_name, category, quantity, expiry_date, price FROM medicines");
             ResultSet rs = stmt.executeQuery()) {

            StringBuilder inventoryTable = new StringBuilder();
            while (rs.next()) {
                inventoryTable.append("<tr>")
                    .append("<td>").append(rs.getString("medicine_id")).append("</td>")
                    .append("<td>").append(rs.getString("medicine_name")).append("</td>")
                    .append("<td>").append(rs.getString("category")).append("</td>")
                    .append("<td>").append(rs.getInt("quantity")).append("</td>")
                    .append("<td>").append(rs.getString("expiry_date")).append("</td>")
                    .append("<td>₹").append(rs.getDouble("price")).append("</td>")
                    .append("</tr>");
            }
            out.print(inventoryTable.toString());
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<tr><td colspan='6' style='color:red;'>Error loading inventory</td></tr>");
        }
    }
}
