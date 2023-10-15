<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login here</title>

<%@include file="component/all_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mt-8">
					<div class="card-header text-center background text-white">
						<h2 style="color:  #4db6ac">Login</h2>
					</div>
					
					
					<!-- Login Alert message if failed -->
					<%
					String loginFail = (String)session.getAttribute("login-error");
					
					if(loginFail != null)
					{%>
					
					<div class="alert alert-danger text-center" role="alert"><%=loginFail %></div>
						
					<%
					session.removeAttribute("login-error");
					}
					%>
					
					
					<!-- Without login -->
					<%
					String withoutLogin = (String)session.getAttribute("loginerror");
					
					if(withoutLogin != null) {
					%>
					<div class="alert alert-danger text-center" role="alert"><%=withoutLogin %></div>
						
					<%
					session.removeAttribute("loginerror");
					}
					%>
					
						<%
					String logoutMsg = (String)session.getAttribute("logoutMsg");
					
					if(logoutMsg != null)
					{%>
					
					<div class="alert alert-success text-center" role="alert"><%=logoutMsg %></div>
						
					<%
					session.removeAttribute("logoutMsg");
					}
					%>
					
					
					
					 
					<div class="card-body">
						<form action="loginServlet" method="post">
												
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label>
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="useremail" placeholder="Enter email" required>
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" name="userpassword" placeholder="Password" required>
							</div>
	
							<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
							<p style="text-align: center; margin-top: 10px">Don't have an account?<a href="register.jsp">Register</a></p>
						</form>
					</div>


				</div>

			</div>
		</div>
	</div>

<%-- 	<%@include file="component/footer.jsp"%> --%>

</body>
</html>