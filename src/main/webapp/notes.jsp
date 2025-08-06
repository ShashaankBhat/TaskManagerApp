<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Notes</title>
    <style>
        /* General reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Sidebar styling */
        .sidebar {
            width: 220px;
            background-color: #8B4513; /* Brown color for sidebar */
            color: white;
            height: 100vh;
            padding-top: 30px;
            position: fixed;
            left: 0;
            top: 0;
            overflow-y: auto;
            text-align: center;
        }
        .sidebar h4 {
            color: #ffde00; /* Bright yellow for the username */
            margin-bottom: 25px;
        }
        .sidebar a {
            display: block;
            padding: 10px 15px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 8px 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background-color: #5a67d8; /* Lighter shade on hover */
            color: #fff;
        }

        /* Main content styling */
        .main-content {
            margin-left: 240px;
            padding: 30px;
            background-color: #f4f4f9;
            min-height: 100vh;
        }
        h1 {
            color: #333;
            font-size: 2em;
            margin-bottom: 15px;
        }
        
        /* Note form styling */
        form {
            display: flex;
            flex-direction: column;
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        textarea {
            resize: vertical;
            padding: 10px;
            font-size: 1em;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            background-color: #8B4513;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5a67d8;
        }

        /* Notes list styling */
        .notes-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .note-item {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .note-item p {
            color: #333;
            font-size: 1em;
            margin-right: 20px;
            flex: 1;
        }
        .note-actions {
            display: flex;
            gap: 10px;
        }
        .note-actions button {
            background-color: #ff6347; /* Red color for action buttons */
            padding: 8px 12px;
            border-radius: 4px;
            font-size: 0.9em;
            transition: background-color 0.3s;
        }
        .note-actions button:hover {
            background-color: #ff4500;
        }

        .no-notes {
            color: #777;
            font-style: italic;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
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

    <!-- Main Content Area -->
    <div class="main-content">
        <h1>My Notes</h1>

        <!-- Add Note Form -->
        <form action="AddNoteServlet" method="post">
            <textarea name="noteContent" placeholder="Enter your note here..." required></textarea>
            <button type="submit">Add Note</button>
        </form>

        <!-- Notes List -->
        <h2>Notes List</h2>
        <div class="notes-list">
            <%
                List<String> notesList = (List<String>) session.getAttribute("notesList");
                if (notesList != null && !notesList.isEmpty()) {
                    for (int i = 0; i < notesList.size(); i++) {
                        String note = notesList.get(i);
            %>
                        <div class="note-item">
                            <p><%= note %></p>
                            <div class="note-actions">
                                <form action="EditNoteServlet" method="post">
                                    <input type="hidden" name="noteIndex" value="<%= i %>">
                                    <button type="submit">Edit</button>
                                </form>
                                <form action="DeleteNoteServlet" method="post">
                                    <input type="hidden" name="noteIndex" value="<%= i %>">
                                    <button type="submit">Delete</button>
                                </form>
                            </div>
                        </div>
            <%
                    }
                } else {
            %>
                    <p class="no-notes">No notes available.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
