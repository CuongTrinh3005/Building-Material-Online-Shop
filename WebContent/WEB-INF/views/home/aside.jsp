<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<div class="panel panel-default">
	<div class="panel-heading">GIỎ HÀNG</div>
	<div class="panel-body">
		<img alt="giỏ hàng" src="images/cart.jpg" class="col-sm-5">
		<ul class="col-sm-7">
			<li> Số mặt hàng: <b>${num_items}</b></li>
			<li> Tổng tiền: <b><f:formatNumber value="${cost}" pattern="#,###,###"/></b> VNĐ </li>
			<li><a href="cart/index.htm">Xem giỏ hàng</a></li>
		</ul>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">TÌM KIẾM</div>
	<div class="panel-body">
		<form action="product/search.htm" method="post">
			<input value="${param.keywords}" name="keywords" class="form-control" placeholder="Keywords">
		</form>
		${message1}
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">DANH MỤC</div>
	<div class="list-group">
		<c:forEach var="c" items="${cates}">
			<a href="product/list-by-category/${c.getCategoryId()}.htm" class="list-group-item">${c.getName()}</a> 
		</c:forEach>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">ĐẶC BIỆT</div>
	<div class="list-group">
		<a href="product/top-newest.htm" class="list-group-item">Hàng mới</a> 
		<a href="product/top-order.htm" class="list-group-item">Bán chạy</a> 
		<a href="product/top-view.htm" class="list-group-item">Xem nhiều</a>
		<a href="product/top-discount.htm" class="list-group-item">Giảm giá</a>
	</div>
</div>