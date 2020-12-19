<%@page import="org.hibernate.Transaction"%>
<%@page import="com.ankita.Note"%>
<%@page import="com.helper.*"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<h1>Edit Your Note</h1>
		<hr>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		
		<form action="UpdateServelet" method="post">
		<input value="<%= note.getId()%>" name="noteId"  type="hidden">
		<div class="form-group">
			<label for="notestitle">Note Title</label> <input required
				name="notestitle" type="text" class="form-control" id="notestitle"
				aria-describedby="notes" placeholder="Enter Notes Title"
				value = "<%=note.getTitle() %>" />
		</div>
		<div class="form-group">
			<label for="content">Note</label>
			<textarea name="content" required id="content"
				placeholder="Enter Your Content Here" class="form-control"
				style="height: 300px"><%= note.getContent() %></textarea>
		</div>
		<div class="container text-center">
			<button type="submit" class="btn btn-primary">Save</button>
		</div>
	</form>
		
</div>


</body>
</html>