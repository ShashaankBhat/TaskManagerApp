import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AddNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteContent = request.getParameter("noteContent");
        HttpSession session = request.getSession();
        
        // Retrieve existing notes or create a new list
        List<String> notesList = (List<String>) session.getAttribute("notesList");
        if (notesList == null) {
            notesList = new ArrayList<>();
        }
        
        // Add the new note to the list
        notesList.add(noteContent);
        session.setAttribute("notesList", notesList);  // Save updated notes back to the session
        
        // Redirect back to notes page
        response.sendRedirect("notes.jsp");
    }
}