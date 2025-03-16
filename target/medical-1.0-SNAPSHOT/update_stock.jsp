<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background: url('imgs/loginbackground.jpeg') no-repeat center center/cover;
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
        h2 { margin-bottom: 20px; }
        .link-button {
            display: block;
            margin: 10px 0;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
        }
        .link-button:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Stock</h2>
        <a href="add_medicine.jsp" class="link-button">Add New Medicine</a>
        <a href="update_medicine.jsp" class="link-button">Update Existing Medicine</a>
        <a href="delete_medicine.jsp" class="link-button">Remove Medicine</a>
        <a href="pharmacist_dashboard.jsp" class="link-button">Back to Dashboard</a>
    </div>
</body>
</html>
