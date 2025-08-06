import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class EditNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> notesList = (List<String>) session.getAttribute("notesList");
        
        // Get the index of the note to edit
        int noteIndex = Integer.parseInt(request.getParameter("noteIndex"));
        
        // Get the note content
        String noteContent = notesList.get(noteIndex);
        
        // Set attributes for the edit page
        request.setAttribute("noteIndex", noteIndex);
        request.setAttribute("noteContent", noteContent);
        
        // Forward to the edit page
        request.getRequestDispatcher("editNote.jsp").forward(request, response);
    }
}