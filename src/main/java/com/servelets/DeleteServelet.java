package com.servelets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ankita.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServelet
 */
public class DeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServelet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			
			Note note = s.get(Note.class, noteId);
			Transaction tx = s.beginTransaction();
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch(Exception e)
		{
			
		}
	}
}
