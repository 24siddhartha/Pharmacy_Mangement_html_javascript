<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription Order - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('https://source.unsplash.com/1600x900/?pharmacy,prescription') no-repeat center center/cover;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .submit-button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .submit-button:hover {
            background-color: #218838;
        }
        .back-button {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Prescription Order</h2>
        <form action="process_prescription.jsp" method="POST">
            <div class="form-group">
                <label for="patient_name">Patient Name:</label>
                <input type="text" id="patient_name" name="patient_name" required>
            </div>
            <div class="form-group">
                <label for="doctor_name">Doctor Name:</label>
                <input type="text" id="doctor_name" name="doctor_name" required>
            </div>
            <div class="form-group">
                <label for="medicine_id">Medicine ID:</label>
                <input type="text" id="medicine_id" name="medicine_id" required>
            </div>
            <div class="form-group">
                <label for="medicine_name">Medicine Name:</label>
                <input type="text" id="medicine_name" name="medicine_name" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" required>
            </div>
            <button type="submit" class="submit-button">Submit Order</button>
        </form>
        <a href="pharmacist_dashboard.html" class="back-button">Back to Dashboard</a>
    </div>

        <script>
        function autofillData() {
            let idInput = document.getElementById("search_id");
            if (!idInput) return;

            let idValue = idInput.value;
            fetch('FetchDataServlet?id=' + idValue)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        for (let key in data) {
                            let inputField = document.getElementById(key);
                            if (inputField) {
                                inputField.value = data[key];
                            }
                        }
                    }
                })
                .catch(error => console.error('Auto-fill Error:', error));
        }
        </script>
        
</body>
</html>
