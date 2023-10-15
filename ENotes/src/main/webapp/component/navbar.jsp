
<%@page import="com.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bgcustom">
	<h2>
		<img alt="" src="img/sticky-notes.png"> E-Notes
	</h2>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp">AddNote</a>
			</li>

			<li class="nav-item"><a class="nav-link" href="showNotes.jsp">ShowNotes</a>
			</li>
		</ul>

		<%
		UserDetails user = (UserDetails) session.getAttribute("userD");
		if (user != null) {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal" type="submit"><%=user.getName()%></a>
		<a class="btn btn-light my-2 my-sm-0" href="LogoutServlet" type="submit">Logout</a>



		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Your Details</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container text-center">
							<table class="table">
								<tbody>
									<tr>
										<th>User Id:</th>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<th>Name:</th>
										<td><%=user.getName()%></td>
									</tr>

									<tr>
										<th>Email</th>
										<td><%=user.getEmail()%></td>
									</tr>

								</tbody>

							</table>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>




		<%
		} else {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" href="login.jsp"	type="submit">Login</a>
		<a class="btn btn-light my-2 my-sm-0" href="register.jsp" type="submit">Register</a>
		<%
		}
		%>

	</div>



</nav>