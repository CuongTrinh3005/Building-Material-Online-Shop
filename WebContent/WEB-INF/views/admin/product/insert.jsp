<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Add new Product</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
	
	<style type="text/css">
		.img_products{
			height: 150px !important;
			max-width: 100%;
		}
		
		*[id$=errors]{
			color: red;
			font-style: italic;
		}
		
		.error_img{
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
				<h1><b>New product</b></h1>
				<h4>${message}</h4>
				
				<form:form action="admin/product/insert.htm" method="post" modelAttribute="product" 
				enctype="multipart/form-data">
				 
					<div class="form-group">
						<label>ID: </label>
						<br>
						<form:input path="productId"/>
						<form:errors path="productId"/>
					</div>
						
					<div class="form-group">
						<label>Name: </label>
						<br>
						<form:input path="name"/>
						<form:errors path="name"/>
					</div>
					
					<div class="form-group">
						<label>Unit Price: </label>
						<br>
						<form:input path="unitPrice"/>
						<form:errors path="unitPrice"/>
					</div>
					
					<div class="form-group">
						<label>Discount: </label>
						<br>
						<form:input path="discount"/>
					</div>
					
					<div class="form-group">
						<label>Đơn vị tính: </label>
						<br>
						<form:input path="donViTinh"/>
					</div>
					
					<div class="form-group">
							<label>Photo   : </label>
							<br>
							<input type="file" name="photo_file">
							<p class="error_img">${message_img}</p>
							<form:hidden path="photo"/>
						</div>
					
					<div class="form-group">
						<label>Category: </label>
						<form:select path="category.categoryId" name="category">
							<c:forEach var="c" items="${cates}">
								<form:option value="${c.getCategoryId()}" label="${c.getName()}"></form:option>
							</c:forEach>
						</form:select>
						<br>
					</div>
					
					<div class="form-group">
						<label>Description: </label>
						<br>
						<form:textarea path="description" rows="5" cols="80"/>
					</div>
					
					<div class="form-group">
						<label>Specification: </label>
						<br>
						<form:textarea path="specification" rows="5" cols="80"/>
					</div>
					
					<div class="form-group">
						<label>ViewCount: </label>
						<br>
						<form:input path="viewCount"/>
					</div>
					
					<div class="form-group">
						<label>Special: </label>
						<br>
						<form:radiobutton path="special" value="0" label="False"/>
						<form:radiobutton path="special" value="1" label="True"/>
						<form:errors path="special"/>
					</div>
					
					<!-- form:hidden path="dateIn"/> -->
					<div class="form-group">
						<label>Date Check In: </label>
						<br>
						<form:input path="dateIn"/>
						<form:errors path="dateIn"/>
					</div>

					<div class="form-group">
						<label>Available: </label>
						<br>
						<form:radiobutton path="available" value="0" label="False"/>
						<form:radiobutton path="available" value="1" label="True"/>
						<form:errors path="available"/>
					</div>
					
					<div><button>Add</button></div>
					
				</form:form>
				<br>
				<a href="admin/product/index.htm">
					<button class="btn btn primary">Refresh List</button>
				</a>
			</article>
		</div>
		
<script type="text/javascript">
//<![CDATA[
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  //]]>
  </script>
		
		<footer class="row">
			<p class=" col-sm-10">@Copyright: Author: TrinhQuocCuong - Class: D17CQCP01-N - Student ID: N17DCCN017</p>
			<h5 class=" col-sm-2">HOTLINE: 123 456 789 0</h5>
		</footer>
	</div>

</body>
</html>