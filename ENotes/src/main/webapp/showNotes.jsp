<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect(" login.jsp");

	session.setAttribute("loginerror", "Please login....");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>

<%@include file="component/all_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

		
	<%
	String updateMsg = (String)session.getAttribute("updateMsg");
	if(updateMsg != null)
	{
	%>
		<div class="alert alert-success text-center" role="alert"><%= updateMsg%></div>		
	<%
	
	session.removeAttribute("updateMsg");
	}
	%>
	
	<%
	String DeleteMsgError = (String)session.getAttribute("DeleteMsgError");
	if(DeleteMsgError != null)
	{
	%>
		<div class="alert alert-danger text-center" role="alert"><%= DeleteMsgError%></div>
		
	<%
	session.removeAttribute("DeleteMsgError");
	}
	%>
	


	<div class="container">
		<h1 class="text-uppercase text-center text-secondary">All Notes:</h1>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					PostDAO ob = new PostDAO(DBConnect.getConn());
					List<Post> post = ob.getData(user3.getId());

					for (Post po : post) {
				%>

				<div class="card mt-3">
					<img class="card-img-top mt-2 mr-2 mb-0 ml-2" style="max-width: 50px;" src="img/sticky-notes.png" alt="Card image cap">
					<div class="card-body p-3">
						<h5 class="card-title"><%= po.getTitle() %></h5>
						<p class="card-text"><%= po.getContent() %> </p>
 
						<p>
							<b class="text-success mb-0">Modified By: <%= user3.getName() %></b>
						</p>
						<p>
							<b class="text-danger mt-0">Modified date: <%= po.getPdate() %></b>
						</p>
						<div class="container text-center">
							<a href="edit.jsp?note_id=<%=po.getId() %>"	class="btn btn-primary">Update</a>
							
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>



			</div>

		</div>



	</div>

</body>
</html>