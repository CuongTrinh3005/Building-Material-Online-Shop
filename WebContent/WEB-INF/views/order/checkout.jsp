<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Checkout</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		*[id$=errors]{
			color: red;
			font-style: italic;
		}
	
		.img_products{
			height: 150px !important;
			max-width: 100%;
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
				<h1><b>Fill Checkout Form</b></h1>
				<h4>${message}</h4>
				
				<div>
					<h3 class="alert alert-info " align="center"> DANH SÁCH CÁC MẶT HÀNG</h2>
					<table class="table table-hover">
					<thead>
						<tr>
							<td><b>ID</b></td>
							<td><b>Name</b></td>
							<td><b>Quantity</b></td>
							<td><b>Unit Price</b></td>
							<td><b>Discount</b></td>
							<td><b>Total Price</b></td>
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
								<td>${p.getQuantity()}</td>
								<td><f:formatNumber value="${p.getUnitPrice()}" pattern="#,###,###"/> VNĐ </td>
								<td><f:formatNumber value="${p.getDiscount()}" type="percent"/></td>
								<td><f:formatNumber value="${p.getQuantity() * p.getUnitPrice() * (1-p.getDiscount())}"
									 pattern="#,###,###"/> VNĐ </td>
					
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				<p><b>Total Price: <f:formatNumber value="${total}" pattern="#,###,###"/> VNĐ</b></p>
				<hr>
				</div>
				
				<div>
					<h3 class="alert alert-warning" align="center"> THÔNG TIN GIAO DỊCH</h2>
					<form:form action="order/checkout.htm" method="post" modelAttribute="order">
						<div class="form-group">
							<label>Customer ID: </label>
							<br>
							<form:input path="customer.customerId" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Customer Name: </label>
							<br>
							<input type="text" value="${order.getCustomer().getName()}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>Date Checkout: </label>
							<br>
							<form:input path="orderDate" readonly="true"/>
							<form:errors path="orderDate"/>
						</div>
						
						<div>
							<label>Address: </label>
							<form:input type="text" path="address" class="form-control"/>
							<form:errors path="address"/>
						</div>
						
						<div>
							<label>Description : </label>
							<form:input type="text" path="description" class="form-control"/>
						</div>
						
						<br>
						<div>
							<form:button>Purchase</form:button>
						</div>
					</form:form>
				</div>
			</article>
		</div>
		
		<br>
		<hr>
		<footer class="row">
			<p class=" col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>