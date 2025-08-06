# Task Manager Web Application

**Task Manager** is a full-stack web application developed using Java (Servlets and JSP) with MySQL as the backend database. It allows users to manage their daily tasks, track progress, maintain notes, and view task history — all through a clean and user-friendly interface.

---

## 🔹 Features

- **User Authentication** – Signup and login functionalities for secure access
- **Task Management** – Create, update, and delete tasks
- **Task Prioritization** – Assign Low, Medium, or High priority
- **Status Tracking** – Mark tasks as Pending, In Progress, or Completed
- **Task History** – Log of completed and modified tasks
- **Notes Section** – Store general notes or task-specific comments
- **User-Based Isolation** – Each user sees only their own tasks and data

---

## 🔹 Tech Stack

### Frontend:
- HTML & CSS
- JSP (Java Server Pages)

### Backend:
- Java Servlets
- JSP
- Apache Tomcat Server

### Database:
- MySQL

---

## 🔹 Database Schema

The application consists of four main tables:

1. **Users** – Stores user credentials and information
2. **Tasks** – Stores active task data per user
3. **Task History** – Logs task changes or completions
4. **Notes** – Stores additional textual data from users

---

## 🔹 How to Run the Project

### Prerequisites:
- Java JDK 8+
- Apache Tomcat 9+
- MySQL Server
- IDE like VS Code, IntelliJ, or Eclipse

### Setup Instructions:

1. **Clone this repository**
```bash
git clone https://github.com/your-username/TaskManagerApp.git
```

2. **Import project** into your Java IDE as a web application project.

3. **Set up MySQL database**
   - Create a database named `taskmanager_db`
   - Run SQL scripts (if provided) or manually create tables as per schema.

4. **Configure DB credentials**
   - Update your `DBConnection.java`:
     ```java
     String url = "jdbc:mysql://localhost:3306/taskmanager_db";
     String user = "your_username";
     String password = "your_password";
     ```

5. **Deploy to Tomcat Server**
   - Build the WAR or run directly from IDE
   - Access it at `http://localhost:8080/TaskManagerApp`

---

## 🔹 Screenshots

_Screenshots coming soon: Dashboard, Task List, Notes Page, etc._

---

## 🔹 License

This project is licensed under the **MIT License**. Feel free to use and modify it for personal or educational purposes.

---

## 🔹 Author

**Shashank Bhat**  
Final Year CSE Student  
GitHub: [ShashaankBhat](https://github.com/ShashaankBhat)
