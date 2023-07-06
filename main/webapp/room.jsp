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
.room {
	background-image: url('image/room.jpg');
	background-size: cover;
	color: #ffffff;
	padding: 100px 25px;
	margin-bottom: 0;
}

.textfeatures i {
	color: #ae9548;
	display: inline-block;
	font-size: 200%;
}

.panelroom {
	border: 2px solid #ae9548;
	border-radius: 0;
	transition: box-shadow 0.5s;
	margin-top: 100px;
	margin-bottom: 100px;
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .5);
}

.panelroom:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, 1);
}

.slide {
	border: 4px solid #282834;;
	border-radius: 0;
	transition: box-shadow 0.5s;
	margin-top: 20px;
	margin-bottom: 20px;
}

.room-text .room-title {
    overflow: hidden;
    margin-bottom: 18px;
    padding-right: 50px;
}

.room-text .room-title h2 {
    float: left;
    font-size: 36px;
    color: #2d220f;
}

.room-text .room-title .room-price span {
    position: absolute;
    left: -50px;
    bottom: 7px;
    font-size: 20px;
    font-family: serif;
    font-weight: 300;
    line-height: 25px;
    color: #2d220f;
}

.room-text .room-title .room-price sub {
    position: absolute;
    right: -45px;
    bottom: 7px;
    color: #2d220f;
    font-family: serif;
    font-weight: 300;
    font-size: 18px;
    line-height: 25px;
}

.room-text .room-title .room-price {
    float: right;
    position: relative;
}

.room-desc{
    font-size: 25px;
    font-family: fangsong;
}

.button{
   color: #ae9548;
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



	<div class="room text-center">

		<p class="text-center "
			style="width: 100%; margin: auto; font-size: 100px; font-family: serif; color: #00ff14;">
			Rooms</p>

	</div>

	<div class="container-fluid3">
		<div class="row panelroom">
			<div class="col-sm-5 ">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img src="image/rooms/standard-1.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/standard-2.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/standard-3.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/standard-4.jpg" alt="" style="width: 100%;">
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
			<div class="col-sm-7">
				<div class="room-text">
					<div class="room-title">
						<h2>Standard Room</h2>
						<div class="room-price">
							<span>From</span>
							<h2>$99</h2>
							<sub>/night</sub>
						</div>
					</div>
					<div class="room-desc">
						<p>This is the most basic room type at most hotels, 
						some 5 star hotels may not have this room type.</p>
					</div>
					<div class="textfeatures">
					<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
						<div class="col-sm-2">
							<i class="fas fa-tv"></i> <p>Smart TV</p>							
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wifi"></i> <p>High Wi-fii</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wind"></i> <p>AC</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-location-dot"></i> <p>Parking</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-person-swimming"></i> <p>Pool</p>
						</div>
					</div>
					</div>
					<div class="row panelbook" style ="font-size: 150%;">
					<a href="pages/contract/CreateContract.jsp"><button class="btn btn-default">Book Now <i
						class="fas fa-arrow-right"></i></button></a>
				</div>
				</div>
			</div>
		</div>
		<div class="row panelroom">
			<div class="col-sm-5 ">
				<div id="myCarousel2" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img src="image/rooms/double-1.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/double-2.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/double-3.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/double-4.jpg" alt="" style="width: 100%;">
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
			<div class="col-sm-7">
				<div class="room-text">
					<div class="room-title">
						<h2>Double Room</h2>
						<div class="room-price">
							<span>From</span>
							<h2>$199</h2>
							<sub>/night</sub>
						</div>
					</div>
					<div class="room-desc">
						<p>This type of hotel room is relatively better 
						quality than Standard room, the room area is 
						increased.</p>
					</div>
					<div class="textfeatures">
					<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
						<div class="col-sm-2">
							<i class="fas fa-tv"></i> <p>Smart TV</p>							
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wifi"></i> <p>High Wi-fii</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wind"></i> <p>AC</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-location-dot"></i> <p>Parking</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-person-swimming"></i> <p>Pool</p>
						</div>
					</div>
					</div>
					<div class="row panelbook" style ="font-size: 150%;">
					<a href="pages/contract/CreateContract.jsp"><button class="btn btn-default">Book Now <i
						class="fas fa-arrow-right"></i></button></a>
				</div></div>
			</div>
		</div>

		<div class="row panelroom">
			<div class="col-sm-5 ">
				<div id="myCarousel3" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img src="image/rooms/vip-1.jpg" alt="" style="width: 100%;">
						</div>

						<div class="item">
							<img src="image/rooms/vip-2.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/vip-3.jpg" alt="" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="image/rooms/vip-4.jpg" alt="" style="width: 100%;">
						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel3"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel3"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="room-text">
					<div class="room-title">
						<h2>VIP Room</h2>
						<div class="room-price">
							<span>From</span>
							<h2>$299</h2>
							<sub>/night</sub>
						</div>
					</div>
					<div class="room-desc">
						<p>This is the most luxurious room in all hotel room types, 
						usually located on the top floors.</p>
					</div>
					<div class="textfeatures">
					<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
						<div class="col-sm-2">
							<i class="fas fa-tv"></i> <p>Smart TV</p>							
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wifi"></i> <p>High Wi-fii</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-wind"></i> <p>AC</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-location-dot"></i> <p>Parking</p>
						</div>
						<div class="col-sm-2">
							<i class="fas fa-person-swimming"></i> <p>Pool</p>
						</div>
					</div>
					</div>
					<div class="row panelbook" style ="font-size: 150%;">
					<a href="pages/contract/CreateContract.jsp"><button class="btn btn-default">Book Now <i
						class="fas fa-arrow-right"></i></button></a>
				</div></div>
			</div>
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