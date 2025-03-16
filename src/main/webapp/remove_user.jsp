<%@ page import="java.sql.*" %>
<%@ page import="com.myproject.medical.factory.Connector" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove User - Medical Inventory</title>
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
        .form-container select {
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
            background-color: #dc3545;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .form-container button:hover {
            background-color: #c82333;
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
        <h2>Remove User</h2>
        <form action="RemoveUserServlet" method="POST">
            <select name="username" required>
                <option value="" disabled selected>Select a user</option>
                <%
                    try {
                        Connection con = Connector.getCon();
                        String query = "SELECT username FROM appuser WHERE userRole != 'admin'";
                        PreparedStatement ps = con.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String username = rs.getString("username");
                %>
                            <option value="<%= username %>"><%= username %></option>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <button type="submit">Remove User</button>
        </form>
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
