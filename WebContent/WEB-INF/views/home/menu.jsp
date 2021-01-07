<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<header class="row">
	<a href="home/index.htm"><img alt="logo" src="images/building.jpg" class="col-sm-3"></a>
	
	<h1 class="alert alert-success col-sm-7">Building Materials Online Shopping</h1>
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home/index.htm">HOME</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="home/about.htm">About</a></li>
      <li><a href="home/contact.htm">Contact Us</a></li>
      <li><a href="product/index.htm">Product</a></li>
      <li><a href="home/faq.htm">FAQ</a></li>
      <li><a href="home/feedback.htm">Feedback</a></li>
      <li><a href="home/service.htm">Services</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
        <span class="caret"></span></a>
        <c:choose>
        	<c:when test="${empty sessionScope.user}">
        		<ul class="dropdown-menu">
        			<li><a href="account/login.htm">Log in</a></li>
		          	<li><a href="account/register.htm">Register</a></li>
		          	<li><a href="account/forgot-password.htm">Forgot password</a></li>
        		</ul>
        	</c:when>
        	<c:otherwise>
        		<ul class="dropdown-menu">
		          <li><a href="account/update.htm">Update Account</a></li>
		          <li><a href="account/change-password.htm">Change Password</a></li>
		          <li><a href="account/logout.htm">Log Out</a></li>
		          <li><a href="order/list.htm">Orders</a></li>
		          <li><a href="order/items.htm">Bought Items</a></li>
        		</ul>
        	</c:otherwise>
        </c:choose>
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="account/update.htm"><span class="glyphicon glyphicon-user"></span> Hi ${nameUser} !</a></li>
    </ul>
    
  </div>
</nav>