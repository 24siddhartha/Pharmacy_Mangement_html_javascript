package com.myproject.medical.servlets;

import com.myproject.medical.factory.Connector;
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
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/FetchMedicinesServlet")
public class FetchMedicinesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONArray medicinesArray = new JSONArray();

        try (Connection con = Connector.getCon()) {
            String query = "SELECT medicine_id, medicine_name FROM medicines";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JSONObject medicine = new JSONObject();
                medicine.put("id", rs.getString("medicine_id"));
                medicine.put("name", rs.getString("medicine_name"));
                medicinesArray.put(medicine);
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        out.print(medicinesArray.toString());
        out.flush();
    }
}
