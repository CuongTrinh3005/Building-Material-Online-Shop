<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>Building Materials Online Shopping</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<nav class="row">
			<jsp:include page="menu.jsp" />
		</nav>
		
		<div class="row">
			<article class="col-sm-9">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/la.jpg" alt="Chania">
							<div class="carousel-caption">
								<h3>Los Angeles</h3>
								<p>LA is always so much fun!</p>
							</div>
						</div>

						<div class="item">
							<img src="images/chicago.jpg" alt="Chicago">
							<div class="carousel-caption">
								<h3>Chicago</h3>
								<p>Thank you, Chicago!</p>
							</div>
						</div>

						<div class="item">
							<img src="images/ny.jpg" alt="New York">
							<div class="carousel-caption">
								<h3>New York</h3>
								<p>We love the Big Apple!</p>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</article>
			<aside class="col-sm-3">
				<jsp:include page="aside.jsp"></jsp:include>
			</aside>
		</div>
		<footer class="row">
			<p class="col-sm-10">@Copyright: Author: TrinhQuocCuong - Class:
				D17CQCP01-N - Student ID: N17DCCN017</p>
			<div class="col-sm-2">
				<h5 class="row">HOTLINE: 123 456 789 0</h5>
				<a class="row" href="admin/home/index.htm">Admin</a>
			</div>

		</footer>
	</div>

</body>
</html>