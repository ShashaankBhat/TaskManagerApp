<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <h3>User Statistics</h3>
    <p>Total Users: <%= request.getAttribute("userCount") %></p>
    <p>Total Tasks Created: <%= request.getAttribute("taskCount") %></p>
    <p>Total Completed Tasks: <%= request.getAttribute("completedTaskCount") %></p>
    
    <h3>Manage Users</h3>
    <a href="viewUsers.jsp">View All Users</a>
</body>
</html>
