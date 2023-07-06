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

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

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



	<div class="jumbotron text-center">
		<a href="home.jsp"><img src="image/logoHGR.png" alt="Image"
			class="img-responsive" style="width: 30%; margin: auto;"></a>

		<p>We are very pleased to welcome you in here</p>

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
			<div class="text-center "
				style="width: 60%; margin: auto; font-size: 50px; font-family: fantasy;">
				<p>“Customers may forget what you said but they will never
					forget how you made them feel”.</p>
			</div>
		</div>
	</div>


	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-5">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="image/services/restaurant.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/services/spa.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/services/tennis.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/services/pool.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/services/bar.jpg" alt="" style="width: 100%;">
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

			</div>
			<div class="col-sm-7 visit" >
				<p style="font-size: 50px; font-family: fangsong;">Services</p>
				<p style="font-size: 25px; font-family: serif;">
				    Various methods, outstanding organic 
					products and a delightful boutique give H.G.R Spa its reputation
					for excellence.  Whenever your idea of spa travel means a long 
					soak in the bath or escaping to a luxury spa destination, H.G.R Spa
					is your best choice in healthy living and renewal.

				</p>
				<p style="font-size: 20px;">For those who would rather relax and
					 pamper themselves, please stop by the Beauty Salon to make
					 a reservation for a body or foot massage, body treatments, 
					 facials, manicures, pedicures, exfoliations, waxing or simply 
					 relax inside our sauna and steam baths.
				</p>
				<a href="Service.jsp"><button style="width: 150px;" type="button" class="btn btn-success">Visit Services
				<span class="glyphicon glyphicon-chevron-right"></span></button></a>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-7">
				<p style="font-size: 50px; font-family: fangsong;">Rooms</p>
				<p style="font-size: 25px; font-family: serif;">
				    All accommodations are luxuriously furnished and feature a private
				    balcony. The resort's beachfront villas are nestled among the 
				    majestic rocks at the foot of the mountain and feature private pools,
				    sundeck and luxury bathroom amenities. Select rooms include a spa 
				    bath and a private dining patio with stunning sea views.

				</p>
				<a href="room.jsp">
				<button style="width: 150px;" type="button" class="btn btn-success">Visit Rooms	
				<span class="glyphicon glyphicon-chevron-right"></span></button></a>
			</div>
			<div class="col-sm-5">
				<div id="myCarousel2" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
					
						<div class="item active">
							<img src="image/rooms/room-1.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/room-2.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/room-3.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/room-4.jpg" alt="" style="width: 100%;">
						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel2"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel2"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>

	
	<div class="card-fluid bg-1 text-center">
		<img src="image/image3.png" style="width: 100%">
	</div>
	<%@include file="includes/footer.jsp"%>


</body>

</html>