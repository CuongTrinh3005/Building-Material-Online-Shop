<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>New category</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.img_products{
			height: 150px !important;
			max-width: 100%;
		}
		
		*[id$=errors]{
			color: red;
			font-style: italic;
		}
	</style>
</head>
<body>

	<div class="container">
		
		<nav class="row">
			<jsp:include page="/WEB-INF/views/admin/home/menu.jsp"/>
		</nav>
		<div class="row">
			<article class="col-sm-9">
				<h1><b>Add new category</b></h1>
				<h4>${message}</h4>
				<div>
					<form:form action="admin/category/insert.htm" method="post" modelAttribute="category">
						<div class="form-group">
							<label>ID: </label>
							<br>
							<form:input path="categoryId"/>
							<form:errors path="categoryId"/>
						</div>
						
						<div class="form-group">
							<label>Name: </label>
							<br>
							<form:input path="name"/>
							<form:errors path="name"/>
						</div>
						
						<div>
							<form:button>Add</form:button>
						</div>
					</form:form>
				</div>
				<br>
				<a href="admin/category/index.htm">
					<button class="btn btn primary">Refresh List</button>
				</a>
			</article>
		</div>
		
		<footer class="row">
			<p class=" col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>