<%@ page import="java.util.List"%>
<%@ page import="example.dao.ServiceDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
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
<title>Service Page</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style>

.service{
    background-image: url('image/service.jpg');
	background-size: cover;
	color: #ffffff;
	padding: 100px 25px;
	margin-bottom: 0;
}


.textfeatures{
    font-family: cursive;
    text-align: center;
    margin-top: 30px;
}

.textfeatures i {
	color: #ae9548;
	display: inline-block;
	font-size: 200%;
}

</style>
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
				<a class="navbar-brand" href="home.jsp">H.G.R Resort</a>
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
								<li class="nav-item"><a class="nav-link" href="readContractServlet">Contract</a></li>
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

	<div class="service text-center">
		<p class="text-center " style="width: 100%; margin: auto; 
		font-size: 100px; font-family: serif; color: #00ff14;">
		Services</p>
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

	<div class="container-fluid text-center bg-img">
		<h1>Our Service</h1>
		<%
			if (!services.isEmpty()) {
				for (Service s : services) {
			%>
		<div class="col-md-3 mt-5">
				<div class="thumbnail">
					<img src="image/services/<%=s.getImage()%>" alt="">
					<p>
						<strong><%=s.getName()%></strong>
					</p>
					<p>
						Category:
						<%=s.getCategory()%></p>
				</div>
			</div>
		<%
			}
			}
			%>
	</div>

<div class="container-fluid">
		<div class="text">
                        <h2>Features</h2>
                    </div>
		<div class="row">
		
		<div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-bell-concierge"></i>
                        <h4>Room Service</h4>
                        <p>Room service is very interesting, customers will be served door to door.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-person-swimming"></i>
                        <h4>Pool</h4>
                        <p>Swimming pool is good for health, customers can freely swim around the lake.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-vault"></i>
                        <h4>Safty Box</h4>
                        <p>Safes are important, customers can protect their personal assets completely.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-utensils"></i>
                        <h4>Restaurant</h4>
                        <p>The restaurant is a place to eat and drink, customers can eat a variety of food and drink here.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-wifi"></i>
                        <h4>Wi-fi</h4>
                        <p>Wifi is an internet service, customers can use the internet </p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-wind"></i>
                        <h4>Air Conditioner</h4>
                        <p>Air conditioning is essential, customers can use to cool or breathe.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-ring"></i>
                        <h4>Wedding</h4>
                        <p>Customers can hold their wedding here to have a beautiful memory.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-phone"></i>
                        <h4>Phone</h4>
                        <p>Public phone is always ready to support customers whenever needed.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-tv"></i>
                        <h4>Smart TV</h4>
                        <p>Television is a device that allows customers to watch good movies on the screen.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-credit-card"></i>
                        <h4>Smart Key</h4>
                        <p>Smart room locks are always the top priority for rooms, ensuring safety.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-user-shield"></i>
                        <h4>24/7 Security</h4>
                        <p>The surveillance and security cameras are always on hand to ensure security.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="textfeatures">
                        <i class="fas fa-location-dot"></i>
                        <h4>Free Parking</h4>
                        <p>Free parking for all guests booking at the resort at all times.</p>
                    </div>
                </div>
		
		</div>
		</div>
		<div class="container-fluid bg-litleblack">
		<div class="card-fluid bg-1 text-center">
			<div class="row">
				<img src="image/services/service-1.jpg" style="width: 24.5%"> <img
					src="image/services/service-2.jpg" style="width: 24.5%"> <img
					src="image/services/service-3.jpg" style="width: 24.5%"> <img
					src="image/services/service-4.jpg" style="width: 24.5%">
			</div>
		</div>
	</div>
	
	<%@include file="includes/footer.jsp"%>

</body>
</html>