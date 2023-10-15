<html>

<head>

<title>Home Write</title>
<%@include file="component/all_css_js.jsp"%>

<style type="text/css">
.image_content {
	display: flex;
	align-items: center;
	justify-content: center;
	justify-content: space-around;
}

#content {
	font-size: 70;
	padding: 0px 80px;
	color: #26A69A;
	line-height: 66px;
	font-family: 'Gabarito', cursive;
	font-family: 'Pacifico', cursive;
	font-family: 'Playfair Display', serif;
}

#button_link{
	margin-top: 100px;
	margin-left: 150px;
	font-size: 23px;
}

#image {
	style ="max-width: 500px";
	padding: 20px;
}
</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container">
		<h1 class=" text-center text-secondary">Welcome to E-Notes application</h1>
		<br>

		<div class="card border-1px">
			<div class="image_content">
				<img id="image" alt="Image" src="img/sticky-notes.png">
				<div class="container">
					<h1 id="content">Write your memorable and future content....</h1>
					<a id="button_link" href="addNotes.jsp" class="btn btn-primary ">Start Now</a>
				</div>
			</div>


		</div>

	</div>

</body>
</html>
