<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Tasks</title>
</head>
<body>
    <h2>Your Task List</h2>
    <a href="addTask.jsp">Add New Task</a>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root123");
                String sql = "SELECT * FROM tasks WHERE user_id = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, userId);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    int taskId = rs.getInt("task_id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String priority = rs.getString("priority");
                    String status = rs.getString("status");
        %>
                    <tr>
                        <td><%= title %></td>
                        <td><%= description %></td>
                        <td><%= priority %></td>
                        <td><%= status %></td>
                        <td>
                            <a href="editTask.jsp?taskId=<%= taskId %>">Edit</a> |
                            <a href="TaskServlet?action=delete&taskId=<%= taskId %>">Delete</a>
                        </td>
                    </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
