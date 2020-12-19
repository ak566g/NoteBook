
<%@page import="org.hibernate.Query"%>
<%@page import="com.ankita.*"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
</head>
<%@include file="all_js_css.jsp"%>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class = "text-uppercase">All Notes:</h1>
		
		<div class="row">
		<div class = "col-12">
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> list = q.list();
		
		for(Note note : list)
		{ %>
			
			<div class="card mt-3">
			  <img class="card-img-top" src="..." alt="Card image cap">
			  <div class="card-body">
			    <h5 class="card-title"><%= note.getTitle() %></h5>
			    <p class="card-text"><%= note.getContent() %></p>
			    <a href="#" class="btn btn-danger">Delete</a>
			  </div>
			</div>
						
		<%}
		s.close();
		%>
		</div>
		</div>
		
		
	</div>
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>