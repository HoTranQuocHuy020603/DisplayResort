<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Page of Create Account</title>
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

/*--- for label of user name---*/
.username {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 5px;
}

#username{
	 margin-top:5px;
}

/*---for heading-----*/
.heading {
	text-decoration: bold;
	text-align: center;
	font-size: 30px;
	color: #F96;
	padding-top: 10px;
}
/*-----------for Password--------*/
.pass {
	color: white;
	margin-top: 9px;
	font-size: 14px;
	font-family: sans-serif;
	margin-left: 6px;
	margin-top: 9px;
}

#password{
 margin-top: 6px;
}

/*--------------for IsAdmin---------------*/
/*--------------label---------*/
.isAdmin {
	color: white;
	font-family: sans-serif;
	font-size: 14px;
	margin-left: 28px;
	margin-top: 8px;
}

/*--------------for IsEmployee---------------*/
/*--------------label---------*/
.idEmployee {
	color: white;
	font-family: sans-serif;
	font-size: 14px;
	margin-left: 28px;
	margin-top: 8px;
}

/*---------- for Input type--------*/
.col-xs-4.Yes {
	color: white;
	font-size: 13px;
	margin-top: 9px;
	padding-bottom: 16px;
}

.col-xs-4.No {
	color: white;
	font-size: 13px;
	margin-top: 9px;
	padding-bottom: 16px;
	padding-right: 95px;
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
	
		<form action="../../createAccountServlet" method="get">
			<!---heading---->
			<header class="heading"> Add New</header>
			<hr></hr>
			<!---Form starting---->
			<div class="row2 ">
				<!--- For UserName---->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="username">User Name :</label>
						</div>
						<div class="col-xs-8">
							<input type="text" name="username" id="fname"
								placeholder="Enter User Name" class="form-control" required>
						</div>
					</div>
				</div>
				<!-----For Password and confirm password---->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4">
							<label class="pass">Password :</label>
						</div>
						<div class="col-xs-8">
							<input type="password" name="password" id="password"
								placeholder="Enter Password" class="form-control" required>
						</div>
					</div>
				</div>

				<!-----------For IsAdmin And IsEmployee-------->
				<div class="col-sm-12">
					<div class="row2">
						<div class="col-xs-4 ">
							<label class="isAdmin">IsAdmin:</label>
						</div>

						<div class="col-xs-4 Yes">
							<input type="radio" name="isAdmin" id="isAdmin" value="1" required>Yes
						</div>

						<div class="col-xs-4 No">
							<input type="radio" name="isAdmin" id="isAdmin" value="0" required>No
						</div>

					</div>

					<div class="row2">
						<div class="col-xs-4 ">
							<label class="isEmployee body2">IsEmployee:</label>
						</div>

						<div class="col-xs-4 Yes">
							<input type="radio" name="isEmployee" id="isEmployee" value="1" required>Yes
						</div>

						<div class="col-xs-4 No">
							<input type="radio" name="isEmployee" id="isEmployee" value="0" required>No
						</div>

					</div>

					<div class="col-sm-12">
						<button type="submit" class="btn btn-warning">Add</button>
					</div>
				</div>
			</div>
		</form>

	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>

