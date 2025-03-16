<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.myproject.medical.factory.Connector" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Medicine</title>
    <link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>
    <div class="container">
        <h2>Add Medicine</h2>
        <form action="AddMedicineServlet" method="post">
            <div class="form-group">
                <label for="medicine_id">Medicine ID:</label>
                <input type="text" name="medicine_id" required>
            </div>
            <div class="form-group">
                <label for="medicine_name">Medicine Name:</label>
                <input type="text" name="medicine_name" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="category">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" required>
            </div>
            <div class="form-group">
                <label for="expiry_date">Expiry Date:</label>
                <input type="date" name="expiry_date">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" name="price" step="0.01" required>
            </div>
            <button class="submit-button" type="submit">Add Medicine</button>
        </form>
        <a href="update_stock.jsp" class="back-button">Back to Stock Management</a>
    </div>
</body>
</html>

