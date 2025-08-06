<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Note</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<h1>Edit Note</h1>

<%
    int noteIndex = (Integer) request.getAttribute("noteIndex");
    String noteContent = (String) request.getAttribute("noteContent");
%>

<form action="UpdateNoteServlet" method="post">
    <textarea name="noteContent" required><%= noteContent %></textarea>
    <input type="hidden" name="noteIndex" value="<%= noteIndex %>"/>
    <input type="submit" value="Update Note"/>
</form>

</body>
</html>
