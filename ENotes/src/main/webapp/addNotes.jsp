<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	UserDetails user1 =  (UserDetails)session.getAttribute("userD");
	if(user1 == null){
		response.sendRedirect("login.jsp");
		session.setAttribute("loginerror", "Please login...");
	}
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>

<%@include file="component/all_css_js.jsp"%>

</head>
<body>

	<%@include file="component/navbar.jsp" %>
	<div class="container">

		<h1 class=" text-center text-secondary">Please Write your
			Contents</h1>

		<!-- This is add form -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNoteServlet" method="post">
						<div class="form-group">
						
						<%
						UserDetails us = (UserDetails)session.getAttribute("userD");
						if(us != null)
						{%>
						
						<input type="hidden" value="<%= us.getId() %>" name="uid">
							
						<%}
						%>
						
						
							<label for="title"><h4>Title</h4></label>
							<input type="text" class="form-control" id="title" aria-describedby="emailHelp" name="title" placeholder="Enter here" required>
						</div>

						<div class="form-group">
							<label for="content"><h4>Content</h4></label>
							<textarea id="content" rows="8" cols="8" placeholder="Enter your content here" class="form-control" name="content" required></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary ">Add</button>
						</div>
					</form>


				</div>
			</div>
		</div>


	</div>




</body>
</html>