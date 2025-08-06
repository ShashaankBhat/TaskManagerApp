<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Task class definition
    class Task {
        private int id;
        private String title;
        private String description;
        private String priority;
        private Date startDate;
        private Date endDate;
        private String status;

        public int getId() { return id; }
        public void setId(int id) { this.id = id; }

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }

        public String getPriority() { return priority; }
        public void setPriority(String priority) { this.priority = priority; }

        public Date getStartDate() { return startDate; }
        public void setStartDate(Date startDate) { this.startDate = startDate; }

        public Date getEndDate() { return endDate; }
        public void setEndDate(Date endDate) { this.endDate = endDate; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }

    // Get the task ID from the request parameter
    String taskIdParam = request.getParameter("id");
    if (taskIdParam == null || taskIdParam.isEmpty()) {
        response.sendRedirect("viewTasks.jsp"); // Redirect if no ID is provided
        return;
    }

    int taskId = Integer.parseInt(taskIdParam);
    String url = "jdbc:mysql://localhost:3306/task";
    String user = "root";
    String password = "root123";
    Task task = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        
        String sql = "SELECT * FROM tasks WHERE id = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, taskId);
        
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            task = new Task();
            task.setId(rs.getInt("id"));
            task.setTitle(rs.getString("title"));
            task.setDescription(rs.getString("description"));
            task.setPriority(rs.getString("priority"));
            task.setStartDate(rs.getDate("start_date"));
            task.setEndDate(rs.getDate("end_date"));
            task.setStatus(rs.getString("status"));
        }
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    
    // Set the taskId as a request attribute for sidebar usage
    request.setAttribute("taskId", taskId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to custom CSS -->
    <title>Edit Task</title>
    <style>
        body {
            display: flex;
            background-color: #f5f5f5;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            margin-left: 240px; /* Leave space for the sidebar */
        }
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <div class="content">
        <h2>Edit Task</h2>
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>
        <% if (task != null) { %>
            <form action="TaskServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= task.getId() %>">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" class="form-control" value="<%= task.getTitle() %>" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" class="form-control" required><%= task.getDescription() %></textarea>
                </div>
                <div class="form-group">
                    <label for="priority">Priority:</label>
                    <input type="text" id="priority" name="priority" class="form-control" value="<%= task.getPriority() %>" required>
                </div>
                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" class="form-control" value="<%= task.getStartDate() != null ? task.getStartDate().toString() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" class="form-control" value="<%= task.getEndDate() != null ? task.getEndDate().toString() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" class="form-control" required>
                        <option value="Pending" <%= "Pending".equals(task.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="In Progress" <%= "In Progress".equals(task.getStatus()) ? "selected" : "" %>>In Progress</option>
                        <option value="Completed" <%= "Completed".equals(task.getStatus()) ? "selected" : "" %>>Completed</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Update Task</button>
            </form>

            <!-- Delete Task Form -->
            <form action="TaskServlet" method="post" style="margin-top: 20px;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= task.getId() %>">
                <button type="submit" class="btn btn-danger btn-block">Delete Task</button>
            </form>

            <a href="viewTasks.jsp" class="btn btn-secondary btn-block">Cancel</a>
        <% } else { %>
            <p class="text-danger">Task not found. Please go back and try again.</p>
        <% } %>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
