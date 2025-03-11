<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - Medical Inventory</title>
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
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: block;
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
        .submit-button, .add-medicine-button, .back-button {
            display: block;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
            text-align: center;
        }
        .submit-button {
            background-color: #28a745;
            color: white;
        }
        .submit-button:hover {
            background-color: #218838;
        }
        .add-medicine-button {
            background-color: #ffc107;
            color: black;
        }
        .add-medicine-button:hover {
            background-color: #e0a800;
        }
        .back-button {
            background-color: #007bff;
            color: white;
            text-decoration: none;
            padding: 12px;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 16px;
            width: 100%;
            border: none;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function addMedicineRow() {
            let table = document.getElementById('medicine-table');
            let row = table.insertRow(-1);
            row.innerHTML = `
                <td><input type="text" name="medicine_id[]" required></td>
                <td><input type="text" name="medicine_name[]" required></td>
                <td><input type="number" name="quantity[]" required></td>
                <td><input type="number" name="price[]" required></td>
            `;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Billing</h2>
        <form action="generate_bill.jsp" method="POST">
            <div class="form-group">
                <label for="customer_id">Customer ID:</label>
                <input type="text" id="customer_id" name="customer_id" required>
            </div>
            <div class="form-group">
                <label for="customer_name">Customer Name:</label>
                <input type="text" id="customer_name" name="customer_name" required>
            </div>
            <div class="form-group">
                <label for="doctor_name">Doctor Name:</label>
                <input type="text" id="doctor_name" name="doctor_name" required>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <table id="medicine-table">
                <tr>
                    <th>Medicine ID</th>
                    <th>Medicine Name</th>
                    <th>Quantity</th>
                    <th>Price per Unit</th>
                </tr>
                <tr>
                    <td><input type="text" name="medicine_id[]" required></td>
                    <td><input type="text" name="medicine_name[]" required></td>
                    <td><input type="number" name="quantity[]" required></td>
                    <td><input type="number" name="price[]" required></td>
                </tr>
            </table>
            <button type="button" class="add-medicine-button" onclick="addMedicineRow()">Add Another Medicine</button>
            <button type="submit" class="submit-button">Generate Bill</button>
        </form>
        <button class="back-button" onclick="window.location.href='pharmacist_dashboard.jsp'">Back to Pharmacist Dashboard</button>
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
