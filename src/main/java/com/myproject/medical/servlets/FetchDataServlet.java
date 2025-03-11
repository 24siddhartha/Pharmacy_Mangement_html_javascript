/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.medical.servlets;

/**
 *
 * @author gugul
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/FetchDataServlet")
public class FetchDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        JSONObject jsonResponse = new JSONObject();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_db", "root", "password");
            
            String query = "SELECT * FROM medicines WHERE id = ? OR name = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, id);
            stmt.setString(2, name);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                jsonResponse.put("medicine_id", rs.getString("id"));
                jsonResponse.put("medicine_name", rs.getString("name"));
                jsonResponse.put("category", rs.getString("category"));
                jsonResponse.put("quantity", rs.getInt("quantity"));
                jsonResponse.put("expiry_date", rs.getString("expiry_date"));
                jsonResponse.put("price", rs.getDouble("price"));
            }
            
            conn.close();
        } catch (Exception e) {
            jsonResponse.put("error", e.getMessage());
        }
        
        out.print(jsonResponse.toString());
        out.flush();
    }
}
