<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Edit Order</title>
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
		
		[id$=errors]{
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
				<h1><b>Edit order</b></h1>
				<h4>${message}</h4>
				<div>
					<form:form action="admin/order/update.htm" method="post" modelAttribute="order">
						<div class="form-group">
							<label>ID: </label>
							<br>
							<form:input path="orderId" readonly="true"/>
						</div>

						<div class="form-group">
							<label>Order Date: </label>
							<br>
							<form:input path="orderDate"/>
							<form:errors path="orderDate"/>
						</div>
						
						<div class="form-group">
							<label>Customer ID: </label>
							<br>
							<form:input path="customer.customerId" readonly="true"/>
						</div>
						
						<div class="form-group">
							<label>Customer Name: </label>
							<br>
							<form:input path="customer.name" readonly="true"/>
						</div>
						
						<div class="form-group">
							<label>Address: </label>
							<form:input type="text" path="address" class="form-control"/>
							<form:errors path="address"/>
						</div>
						
						<div class="form-group">
							<label>Description : </label>
							<br>
							<form:textarea path="description" rows="5" cols="80"/>
						</div>
			
						<div>
							<form:button>Update</form:button>
						</div>
					</form:form>
				</div>
				<br>
				<a href="admin/order/index.htm">
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