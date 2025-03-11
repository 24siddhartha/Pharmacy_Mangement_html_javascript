<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generated Bill - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('https://source.unsplash.com/1600x900/?billing,pharmacy') no-repeat center center/cover;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 650px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .details {
            text-align: left;
            margin-bottom: 20px;
        }
        .details p {
            margin: 5px 0;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
            background: white;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .print-button, .back-button {
            display: inline-block;
            padding: 12px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
        }
        .print-button {
            background-color: #28a745;
            color: white;
        }
        .print-button:hover {
            background-color: #218838;
        }
        .back-button {
            background-color: #007bff;
            color: white;
            text-decoration: none;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function printBill() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Generated Bill</h2>
        
        <div class="details">
            <p><strong>Customer ID:</strong> <%= request.getParameter("customer_id") %></p>
            <p><strong>Customer Name:</strong> <%= request.getParameter("customer_name") %></p>
            <p><strong>Doctor Name:</strong> <%= request.getParameter("doctor_name") %></p>
            <p><strong>Date:</strong> <%= request.getParameter("date") %></p>
        </div>

        <table>
            <tr>
                <th>Medicine ID</th>
                <th>Medicine Name</th>
                <th>Quantity</th>
                <th>Price per Unit</th>
                <th>Total</th>
            </tr>
            <% 
                String[] medicine_ids = request.getParameterValues("medicine_id[]");
                String[] medicine_names = request.getParameterValues("medicine_name[]");
                String[] quantities = request.getParameterValues("quantity[]");
                String[] prices = request.getParameterValues("price[]");

                double grandTotal = 0;
                if (medicine_ids != null) {
                    for (int i = 0; i < medicine_ids.length; i++) {
                        double quantity = Double.parseDouble(quantities[i]);
                        double price = Double.parseDouble(prices[i]);
                        double total = quantity * price;
                        grandTotal += total;
            %>
            <tr>
                <td><%= medicine_ids[i] %></td>
                <td><%= medicine_names[i] %></td>
                <td><%= quantities[i] %></td>
                <td>$<%= prices[i] %></td>
                <td>$<%= total %></td>
            </tr>
            <% 
                    }
                }
            %>
        </table>

        <h3>Total Amount: $<%= grandTotal %></h3>
        
        <button class="print-button" onclick="printBill()">Print Bill</button>
        <a href="pharmacist_dashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>
</html>

