import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Database credentials
        String url = "jdbc:mysql://localhost:3306/task";
        String user = "root";
        String password = "root123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            if ("add".equals(action)) {
                // Handle task addition
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String priority = request.getParameter("priority");
                Date startDate = Date.valueOf(request.getParameter("startDate"));
                Date endDate = Date.valueOf(request.getParameter("endDate"));
                String status = request.getParameter("status");

                String sql = "INSERT INTO tasks (title, description, priority, start_date, end_date, status, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, description);
                statement.setString(3, priority);
                statement.setDate(4, startDate);
                statement.setDate(5, endDate);
                statement.setString(6, status);
                statement.setInt(7, (Integer) request.getSession().getAttribute("userId"));

                statement.executeUpdate();
                request.getSession().setAttribute("successMessage", "Task added successfully.");
                response.sendRedirect("viewTasks.jsp");

            } else if ("update".equals(action)) {
                // Handle task update
                int id = Integer.parseInt(request.getParameter("id"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String priority = request.getParameter("priority");
                Date startDate = Date.valueOf(request.getParameter("startDate"));
                Date endDate = Date.valueOf(request.getParameter("endDate"));
                String status = request.getParameter("status");

                String sql = "UPDATE tasks SET title = ?, description = ?, priority = ?, start_date = ?, end_date = ?, status = ? WHERE id = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, description);
                statement.setString(3, priority);
                statement.setDate(4, startDate);
                statement.setDate(5, endDate);
                statement.setString(6, status);
                statement.setInt(7, id);

                statement.executeUpdate();
                request.getSession().setAttribute("successMessage", "Task updated successfully.");
                response.sendRedirect("editTask.jsp?id=" + id);

            } else if ("delete".equals(action)) {
                // Handle task deletion and move to history
                int id = Integer.parseInt(request.getParameter("id"));
                int userId = (Integer) request.getSession().getAttribute("userId"); // Get logged-in user ID

                // Retrieve the task before deletion
                String fetchSql = "SELECT * FROM tasks WHERE id = ?";
                PreparedStatement fetchStmt = conn.prepareStatement(fetchSql);
                fetchStmt.setInt(1, id);
                ResultSet rs = fetchStmt.executeQuery();

                if (rs.next()) {
                    // Insert task into task_history with user ID
                    String insertHistorySql = "INSERT INTO task_history (title, description, priority, start_date, end_date, status, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement historyStmt = conn.prepareStatement(insertHistorySql);
                    historyStmt.setString(1, rs.getString("title"));
                    historyStmt.setString(2, rs.getString("description"));
                    historyStmt.setString(3, rs.getString("priority"));
                    historyStmt.setDate(4, rs.getDate("start_date"));
                    historyStmt.setDate(5, rs.getDate("end_date"));
                    historyStmt.setString(6, rs.getString("status"));
                    historyStmt.setInt(7, userId); // Associate with logged-in user ID
                    historyStmt.executeUpdate();
                }

                // Delete task from tasks table
                String deleteSql = "DELETE FROM tasks WHERE id = ?";
                PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
                deleteStmt.setInt(1, id);
                deleteStmt.executeUpdate();

                // Set success message for deletion
                request.getSession().setAttribute("successMessage", "Task deleted successfully.");
                response.sendRedirect("viewTasks.jsp");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error processing request.");
        }
    }
}
