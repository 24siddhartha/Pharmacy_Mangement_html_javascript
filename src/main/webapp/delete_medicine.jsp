<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.myproject.medical.factory.Connector" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Medicine</title>
    <link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>
    <div class="container">
        <h2>Delete Medicine</h2>
        <form action="DeleteMedicineServlet" method="post">
            <div class="form-group">
                <label for="medicine_id">Select Medicine:</label>
                <select name="medicine_id">
                    <option value="">Select Medicine</option>
                    <%
                        Connection con = Connector.getCon();
                        PreparedStatement ps = con.prepareStatement("SELECT medicine_id, medicine_name FROM medicines");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                        <option value="<%= rs.getString("medicine_id") %>"><%= rs.getString("medicine_name") %></option>
                    <%
                        }
                        con.close();
                    %>
                </select>
            </div>
            <button class="delete-button" type="submit">Delete Medicine</button>
        </form>
        <a href="update_stock.jsp" class="back-button">Back to Stock Management</a>
    </div>
</body>
</html>
