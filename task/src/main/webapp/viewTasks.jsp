<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to custom CSS -->
    <title>Your Tasks</title>
    <style>
        body {
            display: flex;
            height: 100vh; /* Make the body take the full height */
            background-color: #f5f5f5;
            margin: 0; /* Remove default margin */
        }
        .sidebar {
            min-width: 220px;
            background-color: #8B4513; /* Brown color for sidebar */
            padding: 20px;
            border-right: 1px solid #ddd;
            color: white; /* Change text color for better visibility */
            display: flex;
            flex-direction: column; /* Arrange items vertically */
            justify-content: space-between; /* Space between items */
            height: 100vh; /* Ensure sidebar takes full height */
        }
        .sidebar h4 {
            color: #ffde00; /* Bright color for the username */
            margin-bottom: 20px; /* Add space below the heading */
        }
        .sidebar a {
            display: block;
            padding: 12px 15px;
            margin: 10px 0; /* Increased margin for spacing */
            color: white; /* Change link color */
            text-decoration: none;
            border-radius: 5px; /* Rounded corners for buttons */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        .sidebar a:hover {
            background-color: #5a67d8; /* Lighter shade for hover effect */
        }
        .spacer {
            flex-grow: 1; /* Take up remaining space */
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto; /* Add scroll if content exceeds height */
        }
        table {
            background-color: white; /* Set background for table */
            border-radius: 5px; /* Rounded corners for table */
            overflow: hidden; /* Ensure rounding is applied */
        }
        th {
            background-color: #4e54c8; /* Header color */
            color: white; /* Header text color */
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4>Welcome, 
            <%
                String username = (String) session.getAttribute("username");
                out.print(username != null ? username : "User");
            %>
        </h4>
        <div>
            <a href="viewTasks.jsp">View Tasks</a>
            <a href="addTask.jsp">Add Task</a>
            <a href="history.jsp">History</a>
            <a href="notes.jsp">Notes Section</a>
            <a href="logout.jsp">Logout</a>
        </div>
        <div class="spacer"></div> <!-- Spacer to fill the gap -->
    </div>
    <div class="content">
        <h2>Your Tasks</h2>
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Priority</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Integer userId = (Integer) session.getAttribute("userId");
                    if (userId != null) {
                        String url = "jdbc:mysql://localhost:3306/task";
                        String user = "root";
                        String password = "root123";
                        
                        try (Connection conn = DriverManager.getConnection(url, user, password);
                             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tasks WHERE user_id = ?")) {
                            stmt.setInt(1, userId);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getString("priority") %></td>
                    <td><%= rs.getDate("start_date") %></td>
                    <td><%= rs.getDate("end_date") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <a href="editTask.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <!-- Removed Delete option -->
                    </td>
                </tr>
                <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    } else {
                %>
                    <tr><td colspan="7" class="text-center">Please log in to view your tasks.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="addTask.jsp" class="btn btn-success btn-block">Add New Task</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
