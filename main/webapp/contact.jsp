<%@ page import="java.util.List"%>
<%@ page import="example.dao.ServiceDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page import="example.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ServiceDao sd = new ServiceDao(DbCon.getConnection());
List<Service> services = sd.getAllService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H.G.R Home</title>

<%@include file="includes/head.jsp"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
.contact {
	background-image: url('image/contact.jpg');
	background-size: cover;
	color: #ffffff;
	padding: 100px 25px;
	margin-bottom: 0;
}

.panelcontact {
	border: 3px solid #ae9548;
	border-radius: 0;
	transition: box-shadow 0.5s;
}

.contact-icons li {
	margin-bottom: 30px;
	font-size: 250%;
}

.contact-icons p {
	font-size: 20px;
	font-style: italic;
}

.contact-icons i {
	color: green;
}

.fa-2x {
	font-size: 1em;
	margin-right: 9px;
}
</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand " href="home.jsp">H.G.R Resort</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="Service.jsp">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="room.jsp">Room</a></li>

					<c:if test="${sessionScope.username != null }">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">List<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<c:if test="${sessionScope.username.isAdmin == true }">
									<li class="nav-item"><a class="nav-link"
										href="readAccountServlet">Account</a></li>
								</c:if>
								<li class="nav-item"><a class="nav-link"
									href="readEmployeeServlet">Employee</a></li>
								<li class="nav-item"><a class="nav-link"
									href="readCustomerServlet">Customer</a></li>
								<li class="nav-item"><a class="nav-link"
									href="readContractServlet">Contract</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><i class="fas fa-user"></i>${sessionScope.username.username}<span
								class="caret"></span> </a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="LogoutServlet">Logout</a></li>
							</ul></li>
					</c:if>
					<c:if test="${sessionScope.username == null }">
						<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>



	<div class="contact text-center">

		<p class="text-center "
			style="width: 100%; margin: auto; font-size: 100px; font-family: serif; color: #00ff14;">
			Contact</p>

	</div>

	<section class="book">
		<div class="container flex_space">
			<div class="text">
				<h1>
					<span>Book</span>Your Rooms
				</h1>
			</div>
			<div class="form">
				<form class="gridbook" action="pages/contract/CreateContract.jsp" method="get">
					<input class="text" type="date" placeholder="Arrival Date">
					<input class="text" type="date" placeholder="Departure Date"> 
					<input class="text" type="number"
						placeholder="Adults"> 
					<input class="text" type="number"
						placeholder="Children">
					<input type="submit"
						value="Check Booking">
				</form>
			</div>
		</div>
	</section>

	<div class="container-fluid">
		<div class="row">
			<div class="text-center"
				style="font-size: 150%; font-family: serif; padding: 10px 250px;">
				<p>“Do you have any questions? Please do not hesitate to contact
					us directly. Our team will come back to you within matter of hours
					to help you.”</p>
			</div>
		</div>
	</div>

	<div class="container-fluid3" style="margin-bottom: 50px;">
		<div class="row ">

			<!--Grid column-->
			<div class="col-md-8 col-xl-9 panelcontact">
				<form class="form-group">

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-6"
							style="margin-bottom: 20px; margin-top: 30px;">
							<div class="md-form">
								<label for="name" class="">Your Name</label> <input type="text"
									id="name" name="" class="form-control" required>

							</div>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-md-6"
							style="margin-bottom: 20px; margin-top: 30px;">
							<div class="md-form">
								<label for="email" class="">Your Phone</label> <input
									type="text" id="email" name="" class="form-control">

							</div>
						</div>
						<!--Grid column-->

					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">
						<div class="col-md-12" style="margin-bottom: 20px;">
							<div class="md-form">
								<label for="email" class="">Email</label> <input type="text"
									id="email" name="" class="form-control">
							</div>
						</div>
					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-12">

							<div class="md-form" style="margin-bottom: 20px;">
								<label for="message">Your Message</label>
								<textarea class="form-control" rows="5" id="comment"></textarea>

							</div>

						</div>
					</div>
					<!--Grid row-->

					<div class="center-on-small-only" style="margin-bottom: 30px;">
						<button type="submit" onclick="myFunction()" class="btn btn-primary">Send</button>
					</div>
					
<script>
function myFunction() {
  alert("Access sending your contact!");
}
</script>

				</form>
			</div>

			<!--Grid column-->

			<!--Grid column-->
			<div class="contact1 col-md-4 col-xl-3">
				<ul class="contact-icons">
					<li><i class="fas fa-location-dot fa-2x"></i>Address:
						<p>123 Go to sky, Da Nang, VN</p></li>

					<li><i class="fa fa-phone fa-2x"></i>Phone:
						<p>+ 84 123 1234 12</p></li>

					<li><i class="fa fa-envelope fa-2x"></i>Email:
						<p>myEmail@gmail.com</p></li>
				</ul>
			</div>
			<!--Grid column-->

		</div>
	</div>


	<div class="container-fluid bg-litleblack">
		<div class="card-fluid bg-1 text-center">
			<div class="row">
				<img src="image/rooms/room-1.jpg" style="width: 24.5%"> <img
					src="image/rooms/room-2.jpg" style="width: 24.5%"> <img
					src="image/rooms/room-3.jpg" style="width: 24.5%"> <img
					src="image/rooms/room-4.jpg" style="width: 24.5%">
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>

</html>