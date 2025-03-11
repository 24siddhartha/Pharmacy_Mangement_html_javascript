<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Inventory - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('imgs/loginbackground.jpeg') no-repeat center center/cover;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-container input {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
        .login-container button {
            width: 80%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="./LoginServlet" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
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
