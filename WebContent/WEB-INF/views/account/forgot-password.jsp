<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Building Materials Online Shopping</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.message_err{
			color: red;
			font-style: italic;
		}
	</style>
</head>
<body>

	<div class="container">
		
		<nav class="row">
			<jsp:include page="/WEB-INF/views/home/menu.jsp"/>
		</nav>
		<div class="row">
			<article class="col-sm-9">
				<h1><b>Get Password Page</b></h1>
				<h4>${message}</h4>
				<div>
					<form action="account/forgot-password.htm" method="post">
						<div class="form-group">
							<label>Username: </label>
							<br>
							<input type="text" name="id" value="${param.id}">
							<p class="message_err">${message_err}</p>	
						</div>
						
						<div class="form-group">
							<button class="btn btn-default">Retrieve Password</button>
						</div>
					</form>
				</div>
			</article>
			
			<aside class="col-sm-3">
				<jsp:include page="/WEB-INF/views/home/aside.jsp"></jsp:include>
			</aside>
		</div>
		
		<footer class="row">
			<p class=" col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>