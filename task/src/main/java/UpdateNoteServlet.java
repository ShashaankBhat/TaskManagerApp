import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class UpdateNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> notesList = (List<String>) session.getAttribute("notesList");

        // Get the updated note content and index
        String updatedNoteContent = request.getParameter("noteContent");
        int noteIndex = Integer.parseInt(request.getParameter("noteIndex"));

        // Update the note in the list
        if (notesList != null && noteIndex >= 0 && noteIndex < notesList.size()) {
            notesList.set(noteIndex, updatedNoteContent);  // Update the note
            session.setAttribute("notesList", notesList);  // Update session
        }

        // Redirect back to notes page
        response.sendRedirect("notes.jsp");
    }
}
