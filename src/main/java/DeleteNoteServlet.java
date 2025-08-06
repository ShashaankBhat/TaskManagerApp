
 import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class DeleteNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> notesList = (List<String>) session.getAttribute("notesList");
        
        // Get the index of the note to delete
        int noteIndex = Integer.parseInt(request.getParameter("noteIndex"));

        // Ensure the notes list is not null and index is valid
        if (notesList != null && noteIndex >= 0 && noteIndex < notesList.size()) {
            notesList.remove(noteIndex);  // Remove the note
            session.setAttribute("notesList", notesList);  // Update session with modified list
        }

        // Redirect back to the notes page
        response.sendRedirect("notes.jsp");
    }
}
