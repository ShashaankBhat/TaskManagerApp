<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log the user out
    session.invalidate();

    // Redirect to index.jsp with a logout parameter to display the success message
    response.sendRedirect("index.jsp?logout=true");
%>
