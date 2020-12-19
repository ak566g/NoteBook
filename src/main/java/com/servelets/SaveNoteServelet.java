package com.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ankita.Note;
import com.helper.FactoryProvider;

public class SaveNoteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServelet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			// fetching content and title.
			String title = request.getParameter("notestitle");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
//			System.out.println(note.getId()+" : " + note.getTitle());
//			hibernate:save()
			Session s= FactoryProvider.getFactory().openSession();
			
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style = 'text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style = 'text-align:center;'><a href='all_notes.jsp'> View All Notes </a></h1>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
