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



<style>

.about {
	background-image: url('image/about.jpg');
	background-size: cover;
	color: #ffffff;
	padding: 100px 25px;
	margin-bottom: 0;
}

.fa-tv {
	color: blue;
}

.fa-wifi {
	color: blue;
}

.fa-wind {
	color: blue;
}

.fa-location-dot {
	color: blue;
}

.fa-person-swimming {
	color: blue;
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
								<li class="nav-item"><a class="nav-link" href="#">Contract</a></li>
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



	<div class="about text-center">
		
		<p class="text-center " style="width: 100%; margin: auto; 
		font-size: 100px; font-family: serif; color: #00ff14;">
		About Us</p>

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
			<div class="col-sm-7">
				<h2>About the resort</h2>
				<h3>Excellent location. Very friendly staff.</h3>
				<h4>Hotel very clean with excellent amenities. Would highly
					recommend. Great staff, they are very helpfull. Clean comfy room
					and Nice pool and little gym. Very sad that we had to leave because
					of corona. Breakfast also very good Good location. Walking distance
					to the Old City. Breakfast wasn't extensive but more than decent.
					Comfortable and very clean rooms Featuring an outdoor natural
					swimming pool and free private parking, H.G.R resort offers budget
					accommodation with free Wi-Fi and flat-screen TVs.Wonderful staff</h4>
			</div>
			<div class="col-sm-5">
				<img src="image/home.gif" class="img-responsive margin" alt="image"
					style="width: 100%">
			</div>
		</div>
	</div>

	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-5">
				<span class="glyphicon glyphicon-globe logo"></span>
			</div>
			<div class="col-sm-7">
				<h2>Our Values</h2>
				<h4>
					<strong>MISSION:</strong> Therefore, having to face daily risks
					from life such as polluted environment, lack of energy, work
					diseases, a vacation at high-class resorts is an inevitable
					manifestation of an increasingly modern life. is an indispensable
					need of modern life. So we have a duty to help our customers feel
					comfortable and minimize negativity.
				</h4>
				<p>
					<strong>VISION:</strong> We hope H.G.R Resort will become the
					second home of each customer. That's why, right from the design
					stage, we have been very meticulous in every detail, from living
					room furniture, kitchen area or lighting system for each space so
					that customers feel comfortable and fully enjoy each space. the
					moment when coming to H.G.R Resort
				</p>
			</div>
		</div>
	</div>

	<div class="container-fluid text-center bg-img">
		<h1>Our Service</h1>

		<div class="row text-center">
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
	</div>


	<div class="container-fluid">
		<div class="text-center">
			<h2>Pricing</h2>
			<h4>Choose a payment plan that works for you</h4>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Standard Room</h1>

					</div>
					<div class="panel-body">

						<p>
							<i class="fas fa-tv"></i> Smart TV

						</p>
						<p>
							<i class="fas fa-wifi"></i> High Wi-fi
						</p>
						<p>
							<i class="fas fa-wind"></i> Air-Conditioner
						</p>
						<p>
							<i class="fas fa-location-dot"></i> Parking
						</p>
						<p>
							<i class="fas fa-person-swimming"></i> Pool
						</p>
					</div>
					<div class="panel-footer">
						<h3>From $99</h3>
						<h4>/night</h4>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Double Room</h1>

					</div>
					<div class="panel-body">

						<p>
							<i class="fas fa-tv"></i> Smart TV

						</p>
						<p>
							<i class="fas fa-wifi"></i> High Wi-fi
						</p>
						<p>
							<i class="fas fa-wind"></i> Air-Conditioner
						</p>
						<p>
							<i class="fas fa-location-dot"></i> Parking
						</p>
						<p>
							<i class="fas fa-person-swimming"></i> Pool
						</p>
					</div>
					<div class="panel-footer">
						<h3>From $179</h3>
						<h4>/night</h4>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>VIP Room</h1>

					</div>
					<div class="panel-body">

						<p>
							<i class="fas fa-tv"></i> Smart TV

						</p>
						<p>
							<i class="fas fa-wifi"></i> High Wi-fi
						</p>
						<p>
							<i class="fas fa-wind"></i> Air-Conditioner
						</p>
						<p>
							<i class="fas fa-location-dot"></i> Parking
						</p>
						<p>
							<i class="fas fa-person-swimming"></i> Pool
						</p>
					</div>
					<div class="panel-footer">
						<h3>From $252</h3>
						<h4>/night</h4>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid bg-litleblack">
		<div class="card-fluid bg-1 text-center">
			<div class="row">
				<img src="image/rooms/room-1.jpg" style="width: 24.5%"> 
				<img src="image/rooms/room-2.jpg" style="width: 24.5%"> 
				<img src="image/rooms/room-3.jpg" style="width: 24.5%">
				<img src="image/rooms/room-4.jpg" style="width: 24.5%">
			</div>
		</div>
	</div>
	<div class="card-fluid bg-1 text-center">
		<img src="image/image3.png" style="width: 100%">
	</div>
	
	<%@include file="includes/footer.jsp"%>


</body>

</html>