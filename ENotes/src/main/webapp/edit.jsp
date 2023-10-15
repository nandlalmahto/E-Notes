<%@page import="com.db.DBConnect"%>
<%@page import="com.user.Post"%>
<%@page import="com.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	UserDetails user1 =  (UserDetails)session.getAttribute("userD");
	
	if(user1 == null){
		response.sendRedirect(" login.jsp");
		
		session.setAttribute("loginerror", "Please login....");
	}
	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit your data</title>

<%@include file="component/all_css_js.jsp"%>

</head>
<body>

<%@include file="component/navbar.jsp"%>

<%
Integer noteid = Integer.parseInt(request.getParameter("note_id")); 

PostDAO post = new PostDAO(DBConnect.getConn());
Post p = post.getDataById(noteid);
%>

<div class="container">
		<h1 class=" text-center text-secondary">Update your notes-</h1>
		<br>

		<!-- This is add form -->
		<form action="NoteEditServlet" method="post">
		
		<input type="hidden" value="<%=noteid%>" name="noteid">
		
			<div class="form-group">
			
				<label for="title"><h4>Title </h4></label> 
				<input type="text" class="form-control" id="title" aria-describedby="emailHelp" name="title" value="<%= p.getTitle()%>" placeholder="Enter here" required>
			</div>

			<div class="form-group">
				<label for="content"><h4> Content </h4></label>
				<textarea id="content" rows="8" cols="8" class="form-control" name="content" placeholder="Enter your content here" required><%= p.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-secondary text-white" href="showNotes.jsp">Go Back</button>
				<button type="submit" class="btn btn-primary ">Update</button>
			</div>
		</form>

	</div>


</body>
</html>