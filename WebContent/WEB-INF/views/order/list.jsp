<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>List of orders</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		
		<nav class="row">
			<jsp:include page="/WEB-INF/views/home/menu.jsp"/>
		</nav>
		<div class="row">
			<article class="col-sm-9">
				<div class="row">
					<h1 class="alert alert-info" align="center">Thông tin các đơn đặt hàng</h1>
					
				</div>
				
				<div class="row">
					<p>${message}</p>
				</div>
				
				<div class="row">
					<p class="col-sm-6"><b>ID khách hàng: ${customer.getCustomerId()}</b></p>
					<p class="col-sm-6"><b>Tên khách hàng: ${customer.getName()}</b></p>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<td><b>ID</b></td>
							<td><b>Order Date</b></td>
							<td><b>Address</b></td>
							<td><b>Description</b></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="o" items="${orders}">
							<tr>
								<td>${o.getOrderId()}</td>
								<td>${o.getOrderDate()}</td>
								<td>${o.getAddress()}</td>
								<td>${o.getDescription()}</td>
								<td>
									<a href="order/detail/${o.getOrderId()}.htm">
										<button class="btn btn-info">Detail</button>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
				
			<aside class="col-sm-3">
				<jsp:include page="/WEB-INF/views/home/aside.jsp"></jsp:include>
			</aside>
			
		</div>
		<footer class="row">
			<p class="col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>