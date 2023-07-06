<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Page of Create Customer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/includes/head.jsp"%>
<link rel="icon" type="image/png" href="../../image/favicon.ico" />
<style>
body {
	background-image: url('../../image/quayletan.jpg');
	background-repeat: no-repeat;
	background-size: contain;
	width: 100%;
	height: 100vh;
	overflow: auto;
}

.body2 {
	color: #fff;
}

/*-----for border----*/
.containers {
	font-family: Roboto, sans-serif;
	background-image: url('../../image/darkblueback.jpg');
	border-style: 1px solid grey;
	margin: 0 auto;
	text-align: center;
	opacity: 1.8;
	margin-top: 67px;
	box-shadow: 3px 8px 5px 3px #fff;
	max-width: 500px;
	padding-top: 10px;
	height: 363px;
	margin-top: 166px;
	margin-bottom: 166px;
}

.row2 {
	margin-right: 0px;
	margin-left: 0px;
}

.row {
	margin-right: -15px;
	margin-left: -15px;
}

/*--- for label of first and last name---*/
.lastname {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

.firstname {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 5px;
}

#lastname {
	margin-top: 5px;
}

/*---for heading-----*/
.heading {
	text-decoration: bold;
	text-align: center;
	font-size: 30px;
	color: #F96;
	padding-top: 10px;
}
/*-------for email----------*/
/*------label----*/
#email {
	margin-top: 5px;
}
/*------------for phone Number--------*/
/*-------label-----*/
.email {
	margin-left: 44px;
	font-family: sans-serif;
	color: white;
	font-size: 14px;
	margin-top: 13px;
}

.pno {
	color: white;
	margin-top: 9px;
	font-size: 14px;
	font-family: sans-serif;
	margin-left: 6px;
	margin-top: 9px;
}

#phonenumber {
	margin-top: 6px;
}



/*--------------for Gender---------------*/
/*--------------label---------*/
.gender {
	color: white;
	font-family: sans-serif;
	font-size: 14px;
	margin-left: 28px;
	margin-top: 8px;
}

/*---------- for Input type--------*/
.col-xs-4.male {
	color: white;
	font-size: 13px;
	margin-top: 9px;
	padding-bottom: 16px;
}

.col-xs-4.female {
	color: white;
	font-size: 13px;
	margin-top: 9px;
	padding-bottom: 16px;
	padding-right: 95px;
	padding-left: 2px;
}
/*------------For submit button---------*/
.sbutton {
	color: white;
	font-size: 20px;
	border: 1px solid white;
	background-color: #080808;
	width: 32%;
	margin-left: 41%;
	margin-top: 16px;
	box-shadow: 0px 2px 2px 0px white;
}

.btn.btn-warning:hover {
	box-shadow: 2px 1px 2px 3px #99ccff;
	background: #5900a6;
	color: #fff;
	transition: background-color 1.15s ease-in-out, border-color 1.15s
		ease-in-out, box-shadow 1.15s ease-in-out;
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
				<a class="navbar-brand " href="../../home.jsp">H.G.R Resort</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link" href="../../home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="../../about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="../../Service.jsp">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="../../room.jsp">Room</a></li>

					<c:if test="${sessionScope.username != null }">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">List<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<c:if test="${sessionScope.username.isAdmin == true }">
									<li class="nav-item"><a class="nav-link"
										href="../../readAccountServlet">Account</a></li>
								</c:if>
								<li class="nav-item"><a class="nav-link"
									href="../../readEmployeeServlet">Employee</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../../readCustomerServlet">Customer</a></li>
								<li class="nav-item"><a class="nav-link" 
								    href="../../readContractServlet">Contract</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="../../contact.jsp">Contact</a></li>

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
	<div class="containers">
		<form action="../../createCustomerServlet" method="get">
			<header class="heading"> Add New</header>
			<hr></hr>
			<div class="row2">
				<!--- For Name---->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="firstname">First Name :</label>
						</div>
						<div class="col-xs-8">
							<input type="text" name="firstname" id="firstname"
								placeholder="Enter Your First Name" class="form-control"
								required="required">
						</div>
					</div>
				</div>


				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="lastname">Last Name :</label>
						</div>
						<div class="col-xs-8">
							<input type="text" name="lastname" id="lastname"
								placeholder="Enter Your Last Name" class="form-control last"
								required="required">
						</div>
					</div>
				</div>
				<!-----For email---->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="email">Email :</label>
						</div>
						<div class="col-xs-8">
							<input type="email" name="email"  id="email" placeholder="Enter your email" class="form-control" required="required">
						</div>
					</div>
				</div>
				<!-----For Phone Number---->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="pno">Phone Number :</label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="phonenumber" id="phonenumber"
								required="required" placeholder="Enter Phone Number">
						</div>
					</div>
				</div>

				<!-----------For Gender-------->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4 ">
							<label class="gender">Gender:</label>
						</div>

						<div class="col-xs-4 male">
							<input type="radio" name="gender" id="gender" value="1"
								required="required">Male
						</div>

						<div class="col-xs-4 female">
							<input type="radio" name="gender" id="gender" value="0"
								required="required">Female
						</div>

					</div>
					<div class="col-sm-12">
						<button type="submit" class="btn btn-warning">Submit</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>

