<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('https://source.unsplash.com/1600x900/?medical,hospital') no-repeat center center/cover;
        }
        .header {
            position: absolute;
            top: 10px;
            right: 20px;
        }
        .header a {
            text-decoration: none;
            color: white;
            background-color: red;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
        }
        .header a:hover {
            background-color: darkred;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .form-container h2 {
            margin-bottom: 20px;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-container input {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
        .form-container button {
            width: 80%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .form-container button:hover {
            background-color: #218838;
        }
        .form-container a {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }
        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function confirmLogout() {
            if (confirm("Logout successful!")) {
                window.location.href = "index.jsp";
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <a href="#" onclick="confirmLogout()">Log Out</a>
    </div>
    <div class="form-container">
        <h2>Add User</h2>
        <form action="AddUserServlet" method="POST">
            <input type="text" name="newUsername" placeholder="Username" required>
            <input type="password" name="newPassword" placeholder="Password" required>
            <input type="text" name="userRole" placeholder="User Role (Admin/User)" required>
            <input type="text" name="fullName" placeholder="Full Name" required>
            <input type="date" name="dob" placeholder="Date of Birth" required>
            <input type="tel" name="mobile" placeholder="Mobile Number" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="address" placeholder="Address" required>
            <button type="submit">Add User</button>
        </form>
        <a href="adminDashboard.jsp">Back to Dashboard</a>
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

