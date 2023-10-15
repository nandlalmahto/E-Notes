<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register here</title>

<%@include file="component/all_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mt-8">
					<div class="card-header text-center background text-white">
						<h2 style="color:  #4db6ac">Registration</h2>
					</div>
					
					
					<!-- Registration Alert message if success -->
					<%
					String regSuc = (String)session.getAttribute("reg-success");
					
					if(regSuc != null){
					%>
					<div class="alert alert-success text-center" role="alert"><%=regSuc %> <a href="login.jsp">Login here</a></div>
					<%
					session.removeAttribute("reg-success");
					}
					%>
					
					<!-- Registration Alert message if failed -->
					<%
					String regFail = (String)session.getAttribute("reg-error");
					
					if(regFail != null) {
					%>
					<div class="alert alert-danger text-center" role="alert"><%=regFail %></div>
						
					<%
					session.removeAttribute("reg-error");
					}
					%>
					
					
					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label>
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" placeholder="Enter your name" required>
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label>
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="useremail" placeholder="Enter email" required>
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" name="userpassword" placeholder="Password" required>
							</div>
	
							<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
							
							<p style="text-align: center; margin-top: 10px ">already have an account?<a href="login.jsp">Login</a></p>
							
						</form>
					</div>


				</div>

			</div>
		</div>
	</div>

<%-- 	<%@include file="component/footer.jsp"%> --%>

</body>
</html>