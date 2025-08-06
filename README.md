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

<img width="1062" height="620" alt="image" src="https://github.com/user-attachments/assets/c240db8f-5b56-43fe-b350-824fb5ae2ae9" />


<img width="1047" height="492" alt="image" src="https://github.com/user-attachments/assets/6cd8d768-83d9-4cc8-bbef-24d15fdbe169" />


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

Dashboard 


<img width="1171" height="589" alt="image" src="https://github.com/user-attachments/assets/ec874b31-018b-4d19-ab85-ca5901cc600e" />


Register


<img width="1171" height="592" alt="image" src="https://github.com/user-attachments/assets/504ec269-5e33-4c31-8649-8143b5f1c40b" />


Login:


<img width="1171" height="590" alt="image" src="https://github.com/user-attachments/assets/e6308b43-5895-4753-89d8-97b5c52e274c" />


Tasks 


<img width="1171" height="460" alt="image" src="https://github.com/user-attachments/assets/e36fa7aa-2d8f-4476-b567-4fe247fe231b" />


<img width="1171" height="571" alt="image" src="https://github.com/user-attachments/assets/9936a869-4bda-4a3e-b59f-d1b67c28c920" />


<img width="1171" height="594" alt="image" src="https://github.com/user-attachments/assets/fd9e53f0-af72-44b7-aba6-af0e3ef0943c" />


History of previous task 


<img width="1171" height="512" alt="image" src="https://github.com/user-attachments/assets/86290bad-3392-412f-a509-2a0d0010acb6" />


Notes section 


<img width="1171" height="536" alt="image" src="https://github.com/user-attachments/assets/3b1fc280-6404-41e4-9566-c385955bfffa" />


---

## 🔹 License

This project is licensed under the **MIT License**. Feel free to use and modify it for personal or educational purposes.

---

## 🔹 Author

**Shashank Bhat**  
Final Year CSE Student  
GitHub: [ShashaankBhat](https://github.com/ShashaankBhat)
