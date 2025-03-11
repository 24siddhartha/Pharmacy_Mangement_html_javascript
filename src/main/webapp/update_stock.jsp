<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Stock - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('https://source.unsplash.com/1600x900/?pharmacy,medicine') no-repeat center center/cover;
            margin: 0;
            padding: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 450px;
            text-align: center;
        }
        .form-group { margin-bottom: 15px; text-align: left; }
        label { font-weight: bold; display: block; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ddd; border-radius: 4px; }
        .submit-button, .back-button { width: 100%; padding: 10px; border: none; border-radius: 5px; cursor: pointer; }
        .submit-button { background-color: #28a745; color: white; }
        .submit-button:hover { background-color: #218838; }
        .back-button { display: block; margin-top: 15px; text-decoration: none; background-color: #007bff; color: white; text-align: center; }
        .back-button:hover { background-color: #0056b3; }
        .message { margin-top: 10px; font-weight: bold; color: green; }
    </style>
    <script>
        function fetchMedicineDetails() {
            let medicineId = document.getElementById("medicine_id").value;
            let medicineName = document.getElementById("medicine_name").value;
            if (medicineId || medicineName) {
                fetch(`FetchDataServlet?id=${medicineId}&name=${medicineName}`)
                .then(response => response.json())
                .then(data => {
                    if (!data.error) {
                        document.getElementById("category").value = data.category || "";
                        document.getElementById("quantity").value = data.quantity || "";
                        document.getElementById("expiry_date").value = data.expiry_date || "";
                        document.getElementById("price").value = data.price || "";
                    }
                });
            }
        }

        function toggleFields() {
            let action = document.getElementById("action").value;
            let fields = ["category", "quantity", "expiry_date", "price"];
            fields.forEach(id => document.getElementById(id).disabled = action === "remove");
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Manage Stock</h2>
        <form action="UpdateStockServlet" method="POST">
            <div class="form-group">
                <label for="action">Action:</label>
                <select id="action" name="action" onchange="toggleFields()" required>
                    <option value="add">Add New Medicine</option>
                    <option value="update">Update Existing Medicine</option>
                    <option value="remove">Remove Medicine</option>
                </select>
            </div>
            <div class="form-group" >
                <label for="medicine_id">Medicine ID:</label>
                <select id="medicine_id" name="medicine_id" onchange="fetchMedicineDetails()">
                    <option value="">Select Medicine ID</option>
                    <%  
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT id, name FROM medicines");
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getString("id") %>"><%= rs.getString("id") %> - <%= rs.getString("name") %></option>
                    <%      }
                            conn.close();
                        } catch (Exception e) { e.printStackTrace(); }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="medicine_name">Medicine Name:</label>
                <select id="medicine_name" name="medicine_name" onchange="fetchMedicineDetails()">
                    <option value="">Select Medicine Name</option>
                    <%  
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT id, name FROM medicines");
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getString("name") %>"><%= rs.getString("name") %></option>
                    <%      }
                            conn.close();
                        } catch (Exception e) { e.printStackTrace(); }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" required>
            </div>
            <div class="form-group">
                <label for="expiry_date">Expiry Date:</label>
                <input type="date" id="expiry_date" name="expiry_date" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" required>
            </div>
            <button class="submit-button" type="submit">Submit</button>
        </form>
        <a href="pharmacist_dashboard.jsp" class="back-button">Back to Dashboard</a>
        <p id="message" class="message"></p>
    </div>
</body>
</html>
