<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Check if the user is logged in by verifying a session attribute (like `userId`).
    Integer userId = (Integer) session.getAttribute("userId");
    boolean isLoggedIn = (userId != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Task Management Dashboard</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://startinfinity.s3.us-east-2.amazonaws.com/production/blog/post/5/main/1SvzKctRCi8bwB0QPdOZkBP0pRhsOqZpl0wjs6y0.png') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .navbar {
            background-color: #000000;
        }
        .hero {
            height: 60vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-bottom: 50px;
        }
        .hero-text {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 40px;
            border-radius: 8px;
        }
        .btn-custom {
            background-color: #28a745;
            border: none;
            color: #fff;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .about {
            background-color: rgba(255, 255, 255, 0.9);
            color: #343a40;
            padding: 50px 0;
            display: none;
        }
        .about h2 {
            font-weight: bold;
            margin-bottom: 20px;
        }
        .about p {
            font-size: 1.1rem;
            line-height: 1.6;
        }
        footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            padding: 15px 0;
        }
    </style>
    <script>
        function toggleAboutUs() {
            const aboutSection = document.getElementById("aboutSection");
            if (aboutSection.style.display === "none" || aboutSection.style.display === "") {
                aboutSection.style.display = "block";
                window.scrollTo(0, aboutSection.offsetTop);
            } else {
                aboutSection.style.display = "none";
            }
        }
    </script>
</head>
<body>

    <!-- Navbar with conditional Login/Logout and About Us Links -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">TaskManager</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <% if (isLoggedIn) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a> <!-- Logout Link -->
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="toggleAboutUs()">About Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Display logout message if redirected from logout -->
    <% if ("true".equals(request.getParameter("logout"))) { %>
        <div class="alert alert-success text-center">
            You have been successfully logged out.
        </div>
    <% } %>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-text">
            <h1 class="display-4">Welcome to Task Management System!</h1>
            <p class="lead">Organize, track, and complete your tasks efficiently.</p>
            <% if (!isLoggedIn) { %>
                <a href="register.jsp" class="btn btn-custom">Register</a>
            <% } %>
        </div>
    </div>

    <!-- About Us Section -->
    <section id="aboutSection" class="about text-center">
        <div class="container">
            <h2>About Us</h2>
            <p>
                Staying organized and on top of your workload is essential to your success. 
                Our platform is designed to help you manage your tasks effortlessly, ensuring that you can focus on what matters most—getting things done.
            </p>
            <p>
                Whether you're a student handling assignments, a professional managing projects, or anyone who needs a streamlined system for 
                organizing tasks, our intuitive interface ensures that managing tasks becomes easier and more efficient.
            </p>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="container">
            <p>&copy; 2024 Task Management System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
