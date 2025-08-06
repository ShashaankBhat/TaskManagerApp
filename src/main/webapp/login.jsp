<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Full-page styling */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f9;
        }

        /* Container for split-screen layout */
        .login-container {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Split into two equal columns */
            width: 90%;
            max-width: 1200px;
            height: 80vh; /* Occupies 80% of viewport height */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Subtle shadow */
            border-radius: 10px;
            overflow: hidden;
        }

        /* Left-side image styling */
        .login-image {
            background: url('https://img.freepik.com/premium-vector/creative-workspace-shows-various-tools-calendar-effective-planning-organization-scheduling-planning-organizing-efficient-work-process_538213-159123.jpg?semt=ais_hybrid') no-repeat center center;
            background-size: cover;
        }

        /* Right-side form styling */
        .login-form {
            background-color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #333;
        }

        /* Title styling */
        .login-form h2 {
            color: #4e54c8;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Label and input styling */
        .login-form label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1rem;
        }

        /* Submit button styling */
        .login-form input[type="submit"] {
            background-color: #4e54c8;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-weight: bold;
            margin-top: 20px;
        }

        /* Hover effect for the submit button */
        .login-form input[type="submit"]:hover {
            background-color: #8f94fb;
        }

        /* Link styling */
        .login-form a {
            display: block;
            margin-top: 15px;
            color: #4e54c8;
            text-decoration: none;
            font-weight: bold;
            text-align: center;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .login-container {
                grid-template-columns: 1fr; /* Stack vertically on small screens */
                height: auto;
            }
            .login-image {
                height: 300px; /* Set height for the image section on smaller screens */
            }
        }
    </style>
</head>
<body>

    <!-- Login Form Container with Full Left-Side Image -->
    <div class="login-container">
        
        <!-- Image Section -->
        <div class="login-image">
            <!-- Background image is set in CSS -->
        </div>

        <!-- Form Section -->
        <div class="login-form">
            <h2>Login</h2>
            <form action="LoginServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                <input type="submit" value="Login">
            </form>
            <a href="register.jsp">Don't have an account? Register here.</a>
        </div>
    </div>

</body>
</html>
