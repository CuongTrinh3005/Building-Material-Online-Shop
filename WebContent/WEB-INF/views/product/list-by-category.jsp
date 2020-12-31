<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Product by category</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.img_products{
			height: 150px !important;
			max-width: 100%;
		}
	</style>
</head>
<body>
	<div class="container">

		<nav class="row"> <jsp:include
			page="/WEB-INF/views/home/menu.jsp" /> </nav>
		<div class="row">
			<article class="col-sm-9">
			<h1>Product with its category</h1>
			<div>
				<c:forEach var="p" items="${products}">
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="product/detail/${p.getProductId()}.htm"> 
								<img src="images/product/${p.getPhoto()}" alt="${p.getName()}" class="img_products">
							</a>
							<div class="caption">
								<b><p>${p.getName()}</p></b>
								<p><f:formatNumber value="${p.getQuantity() * p.getUnitPrice() * (1-p.getDiscount())}" pattern="#,###,###"/> VNĐ</p>
								<div class="pull-right">
									<a href="cart/add/${p.getProductId()}.htm">
										<button class="btn btn-sm btn-info btn-add-to-cart">
											<i class="glyphicon glyphicon-shopping-cart"></i>
										</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			</article>

			<aside class="col-sm-3"> <jsp:include
				page="/WEB-INF/views/home/aside.jsp"></jsp:include> </aside>
		</div>

		<footer class="row">
		<p>@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N -
			Student ID: N17DCCN017</p>
		<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>
</body>
</html>