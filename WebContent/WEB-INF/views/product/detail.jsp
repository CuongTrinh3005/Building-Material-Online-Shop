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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.img_products {
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
			<h1>Chi tiết sản phẩm</h1>
			<div class="col-sm-5">
				<div class="thumbnail">
					<a href="images/product/${product.getPhoto()}"> 
						<img src="images/product/${product.getPhoto()}" alt="${p.getName()}" class="img_products">
					</a>
				</div>
			</div>
			<div class="col-sm-7">
				<ul>
					<li><b>Tên sản phẩm: ${product.getName()}</b></li>
					<li>Đơn Giá: <f:formatNumber value="${product.getUnitPrice()}" pattern="#,###,###"/> VNĐ</li>
					<li>Loại sản phẩm: ${product.getCategory().getName()}</li>
					<li>Tình trạng: ${product.getAvailable()?"Còn hàng":"Hết hàng"}</li>
					<li>Giảm giá: <f:formatNumber value="${product.getDiscount()}" type="percent"/></li> 
					<li>Lượt xem: ${product.getViewCount()}</li>
					<li>Hàng đặc biệt: ${product.getSpecial()?"Có":"Không"}</li>
					<li>Thông số kỹ thuật: ${product.getSpecification()}</li>
				</ul>
			</div>
			<br>
			<br>
			<br>
			<br>
			<hr>
			<h2 class="row">Mô tả</h2>
			<p class="row">${product.getDescription()}</p>
			</article>

			<aside class="col-sm-3"> <jsp:include
				page="/WEB-INF/views/home/aside.jsp"></jsp:include> 
			</aside>
		</div>

		<footer class="row">
		<p class=" col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N -
			Student ID: N17DCCN017</p>
		<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>
</body>
</html>