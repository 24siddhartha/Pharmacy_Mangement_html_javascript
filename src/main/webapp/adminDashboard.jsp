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
    <title>Admin Dashboard - Medical Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: url('imgs/loginbackground.jpeg') no-repeat center center/cover;
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
            cursor: pointer;
        }
        .header a:hover {
            background-color: darkred;
        }
        .dashboard-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .dashboard-container h2 {
            margin-bottom: 20px;
        }
        .dashboard-container a {
            display: block;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px;
            border-radius: 5px;
            width: 80%;
            text-align: center;
            margin: 10px auto;
        }
        .dashboard-container a:hover {
            background-color: #0056b3;
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
    <div class="dashboard-container">
        <h2>Admin Dashboard</h2>
        <a href="add_user.jsp">Add User</a>
        <a href="remove_user.jsp">Remove User</a>
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



