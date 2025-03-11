<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Inventory - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('https://source.unsplash.com/1600x900/?pharmacy,medicine') no-repeat center center/cover;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 800px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
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
        .back-button {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px;
            border-radius: 5px;
            width: 200px;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function loadInventory() {
            fetch('ViewInventoryServlet')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('inventory-data').innerHTML = data;
                })
                .catch(error => console.error('Error fetching inventory:', error));
        }

        window.onload = loadInventory;
    </script>
</head>
<body>
    <div class="container">
        <h2>Inventory List</h2>
        <table>
            <tr>
                <th>Medicine ID</th>
                <th>Medicine Name</th>
                <th>Category</th>
                <th>Quantity</th>
                <th>Expiry Date</th>
                <th>Price (₹)</th>
            </tr>
            <tbody id="inventory-data">
                <tr><td colspan="6">Loading inventory...</td></tr>
            </tbody>
        </table>
        <a href="pharmacist_dashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>
</html>


