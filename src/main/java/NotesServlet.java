import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.model.Note; // Make sure you import the Note class

@WebServlet("/NotesServlet")
public class NotesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user id from the session to fetch notes
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        // If no user id found, redirect to login page
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Setup database connection parameters
        String url = "jdbc:mysql://localhost:3306/task";  // Replace with your DB URL
        String user = "root";  // Replace with your DB user
        String password = "root123";  // Replace with your DB password

        List<Note> notesList = new ArrayList<>();

        // Connect to the database and fetch notes
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement("SELECT id, content, created_at FROM notes WHERE user_id = ?")) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getString("content");
                Timestamp createdAt = rs.getTimestamp("created_at");
                notesList.add(new Note(id, content, createdAt)); // Add to list
            }

            // Set the notes list as a request attribute
            request.setAttribute("notesList", notesList);

            // Forward the request to the JSP for rendering
            request.getRequestDispatcher("/notes.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
