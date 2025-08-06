<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar">
    <h4>Welcome, 
        <%
            String username = (String) session.getAttribute("username");
            out.print(username != null ? username : "User");
        %>
    </h4>
    <div>
        <a href="${pageContext.request.contextPath}/viewTasks.jsp">View Tasks</a>
        <a href="${pageContext.request.contextPath}/addTask.jsp">Add Task</a>
        <a href="${pageContext.request.contextPath}/history.jsp">History</a>
        <a href="${pageContext.request.contextPath}/notes.jsp">Notes Section</a>
        <a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
    </div>
</div>

<style>
    .sidebar {
        min-width: 220px;
        background-color: #8B4513; /* Brown color for sidebar */
        padding: 20px;
        color: white;
        height: 100vh; /* Full height of the viewport */
        position: fixed; /* Fixed sidebar */
    }
    .sidebar h4 {
        color: #ffde00; /* Bright color for the username */
        margin-bottom: 20px;
    }
    .sidebar a {
        display: block;
        padding: 12px 15px;
        margin: 10px 0; /* Increased margin for spacing */
        color: white;
        text-decoration: none;
        border-radius: 5px; 
        transition: background-color 0.3s;
    }
    .sidebar a:hover {
        background-color: #5a67d8; /* Lighter shade for hover effect */
    }
</style>
