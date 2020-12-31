<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Account Manager</title>
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
					<h1 class="col-sm-11">Thông tin khách hàng</h1>
					<a class= "col-sm-1" href="admin/account/insert.htm">
						<button class="btn btn-info">Add new user</button>
					</a>
					
				</div>
				
				<div class="row">
					<p>${message}</p>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<td><b>ID</b></td>
							<td><b>Full Name</b></td>
							<td><b>Gender</b></td>
							<td><b>Address</b></td>
							<td><b>Phone Number</b></td>
							<td><b>Email</b></td>
							<td><b>Photo</b></td>
							<td><b>Role</b></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${customers}">
							<tr>
								<td>${c.getCustomerId()}</td>
								<td>${c.getName()}</td>
								<td>${c.getGender()?"Male":"Female"}</td>
								<td>${c.getAddress()}</td>
								<td>${c.getPhoneNumber()}</td>
								<td>${c.getEmail()}</td>
								<td>
									<img alt="avatar" src="images/customer/${c.getPhoto()}" class="img_user">
								</td>
								<td>${c.getAdmin()?"Admin":"User"}</td>
								<td>
									<a href="admin/account/update/${c.getCustomerId()}.htm">
										<button class="btn btn-warning">Edit</button>
									</a>
								</td>
								<td>
									<a href="admin/account/delete/${c.getCustomerId()}.htm">
										<button class="btn btn-danger">Delete</button>
									</a>
								</td>
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