<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Order Detail Manager</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.img_user{
			height: 150px !important;
			max-width: 100%;
		}
	</style>
</head>
<body>

	<div class="container">
		
		<nav class="row">
			<jsp:include page="/WEB-INF/views/admin/home/menu.jsp"/>
		</nav>
		<div class="row">
			<article>
				<div class="row">
					<h1 class="col-sm-11">Thông tin chi tiết đơn đặt hàng</h1>		
				</div>
				
				<div class="row">
					<p>${message}</p>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<td><b>Order ID</b></td>
							<td><b>Product ID</b></td>
							<td><b>Product Name</b></td>
							<td><b>Quantity</b></td>
							<td><b>Unit Price</b></td>
							<td><b>Discount</b></td>
							<td><b>Total</b></td>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="o" items="${orders_dt}">
							<tr>
								<td>${o.getOrderDetailID().getOrderId()}</td>
								<td>${o.getOrderDetailID().getProductId()}</td>
								<td>${o.getProduct().getName()}</td>
								<td>${o.getQuantityOrder()}</td>
								<td><f:formatNumber value="${o.getUnitPrice()}" pattern="#,###,###"/> VNĐ </td>
								<td>${o.getDiscount()}</td>
								<td><f:formatNumber value="${o.getQuantityOrder() * o.getUnitPrice() * (1-o.getDiscount())}"
									 pattern="#,###,###"/> VNĐ </td>
								
								<!-- td -->
									<!-- a href="admin/order/detail/delete/${o.getOrderDetailID().getOrderId()}/${o.getOrderDetailID().getProductId()}.htm" -->
										<!--button class="btn btn-danger">Delete</button>  -->
									<!-- /a> -->
								<!-- /td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
		<footer class="row">
			<p class="col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>