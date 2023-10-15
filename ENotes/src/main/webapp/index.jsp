<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Home Page</title>

<%@ include file="component/all_css_js.jsp" %>

<style type="text/css">

.back-img{
/* background: red; */
background: url("img/eBook.jpg");
width: 100%;
height: 91%;

background-repeat: no-repeat;

background-size: cover;

}
</style>

</head>
<body>

<%@ include file="component/navbar.jsp" %>

<%
Connection conn = DBConnect.getConn();
System.out.println(conn);
%>


<div class="container-fluid back-img">
<h1 style="color: #ff1744 ; text-align: center; padding-top: 25px">E-Notes Save your contents</h1>
</div>
 
 
 
 
 
 <%@include file="component/footer.jsp" %>
 
</body>
</html>