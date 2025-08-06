<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    int userId = (Integer) session.getAttribute("userId"); // Get logged-in user's ID
    String url = "jdbc:mysql://localhost:3306/task";
    String user = "root";
    String password = "root123";

    List<Map<String, Object>> taskHistoryList = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT * FROM task_history WHERE user_id = ? ORDER BY deleted_at DESC";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId); // Filter by user ID

        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            Map<String, Object> task = new HashMap<>();
            task.put("id", rs.getInt("id"));
            task.put("title", rs.getString("title"));
            task.put("description", rs.getString("description"));
            task.put("priority", rs.getString("priority"));
            task.put("startDate", rs.getDate("start_date"));
            task.put("endDate", rs.getDate("end_date"));
            task.put("status", rs.getString("status"));
            task.put("deletedAt", rs.getTimestamp("deleted_at"));
            taskHistoryList.add(task);
        }
        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task History</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="my-4">Task History</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Priority</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Deleted At</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> task : taskHistoryList) { %>
                    <tr>
                        <td><%= task.get("title") %></td>
                        <td><%= task.get("description") %></td>
                        <td><%= task.get("priority") %></td>
                        <td><%= task.get("startDate") %></td>
                        <td><%= task.get("endDate") %></td>
                        <td><%= task.get("status") %></td>
                        <td><%= task.get("deletedAt") %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <a href="viewTasks.jsp" class="btn btn-primary">Back to Tasks</a>
    </div>
</body>
</html>
