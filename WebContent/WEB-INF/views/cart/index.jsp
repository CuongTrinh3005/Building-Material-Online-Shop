<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Cart List</title>
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
					<h1 class="col-sm-9">Thông tin giỏ hàng</h1>
				</div>
				
				<div class="row">
					<p>${message}</p>
				</div>
				
				<form action="cart/update/{id}.htm" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<td><b>ID</b></td>
							<td><b>Name</b></td>
							<td><b>Quantity</b></td>
							<td><b>Unit Price</b></td>
							<td><b>Discount</b></td>
							<td><b>Total</b></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${list}">
							<tr>
								<td>
								${p.getProductId()}
								<input name="id" value="${p.getProductId()}" type="hidden">
								</td>
								<td>${p.getName()}</td>
								<td><input name="quantity_${p.getProductId()}" value="${p.getQuantity()}" type="number" min="1" 
								style="width: 70px;">
								
								</td>
								<td><f:formatNumber value="${p.getUnitPrice()}" pattern="#,###,###"/> VNĐ </td>
								<td><f:formatNumber value="${p.getDiscount()}" type="percent"/></td>
								<td><f:formatNumber value="${p.getQuantity() * p.getUnitPrice() * (1-p.getDiscount())}"
									 pattern="#,###,###"/></td>
							
								<td>
									<a href="cart/update/${p.getProductId()}.htm">
										<button class="btn btn-info" type="submit" value="cart/update/${p.getProductId()}.htm" 
										onclick="form.action='cart/update/${p.getProductId()}.htm';">
											<i class="glyphicon glyphicon-edit" style="height: 20px;"></i>
											Update
										</button>
									</a>
								</td>
								
								
								<td>
									<button class="btn btn-danger" type="submit" value="cart/delete/${p.getProductId()}.htm"  
									onclick="form.action='cart/delete/${p.getProductId()}.htm';">
										<i class="glyphicon glyphicon-trash" style="height: 20px;"></i>
										Remove
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				</form>
				<p><b>Total Price: <f:formatNumber value="${total}" pattern="#,###,###"/> VNĐ</b></p>
				<hr>
				<a href="cart/clear-all.htm"><button class="btn btn-danger">Clear All Cart</button></a>
				
				<a href="order/checkout.htm"><button class="btn btn-success">Checkout</button></a>
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