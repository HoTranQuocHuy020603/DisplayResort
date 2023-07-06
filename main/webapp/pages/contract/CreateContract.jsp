<%@ page import="java.util.List"%>
<%@ page import="example.dao.EmployeeDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
EmployeeDao ed = new EmployeeDao();
List<Employee> employees = ed.selectAllEmployee();
%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Page of Create Contract</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/includes/head.jsp"%>
<link rel="icon" type="image/png" href="../../image/favicon.ico" />
<style>
body {
	background-image: url('../../image/quayletan.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	height: 100vh;
	overflow: auto;
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
	max-width: 600px;
	padding-top: 10px;
	height: 450px;
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

/*---for heading-----*/
.heading {
	text-decoration: bold;
	text-align: center;
	font-size: 30px;
	color: #F96;
	padding-top: 10px;
}

/*--- for label of Charge---*/
.id {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 5px;
}

#id {
    width: 100%;
    margin-left: -30px;
    
}

/*--- for label of falname---*/
.falname {
	margin-left: -120px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 5px;
}

#falname {
    width: 160%;
    margin-left: -100px;
    
}

/*--- for label of Email*/
.email {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#email {
    width: 160%;
    margin-left: -100px;
    margin-top: 10px;
    
}

/*--- for label of phonenumber ----*/
.pno {
	margin-left: -140px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#phonenumber {
    width: 160%;
    margin-left: -100px;
    margin-top: 10px;
    
}

/*--------------for Gender---------------*/
/*--------------label---------*/
.gender {
	color: white;
	font-family: sans-serif;
	font-size: 14px;
	margin-left: 1px;
	margin-top: 15px;
}

/*---------- for Input type--------*/
.male {
	color: white;
	font-size: 13px;
	margin-top: 10px;
	padding-bottom: 16px;
	margin-left: -20px;
}

.male input{
    margin-left: 5px;
}

.female {
    color: white;
	font-size: 13px;
	margin-top: 10px;
	padding-bottom: 16px;
	margin-left: -4px;
}

.female input{
    margin-left: 10px;
}

/*--------------for Adults ---------------*/
.adults {
	margin-left: 10px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#adults {
    width: 135%;
    margin-left: -30px;
    margin-top: 10px;
    
}

/*--------------for Children ---------------*/
.children {
	margin-left: -10px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#children {
    width: 135%;
    margin-left: -30px;
    margin-top: 10px;
    
}

/*--------------for Arrivaldate ---------------*/
.arrivaldate {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#arrivaldate {
    width: 150%;
    margin-left: -90px;
    margin-top: 10px;
    
}

/*--------------for Departuredate ---------------*/

.departuredate {
	margin-left: -120px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#departuredate {
    width: 160%;
    margin-left: -100px;
    margin-top: 10px;
    
}
/*--------------for RoomType ---------------*/
.roomtype {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#roomtype {
    width: 125%;
    margin-left: -60px;
    margin-top: 10px;
    
}

/*--------------for TotalPrice ---------------*/

.totalprice {
	margin-left: -120px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#totalprice {
    width: 160%;
    margin-left: -100px;
    margin-top: 10px;
    
}

/*--------------for Category ---------------*/
.category {
	margin-left: -400px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 15px;
}

#category {
    width: 210%;
    margin-left: -250px;
    margin-top: 10px;
      
}

/*------------For submit button---------*/
.btn.btn-warning {
	margin-top:20px;
}


.btn.btn-warning:hover {
	box-shadow: 2px 1px 2px 3px #99ccff;
	background: #000;
	color: #fff;
	transition: background-color 1.15s ease-in-out, border-color 1.15s
		ease-in-out, box-shadow 1.15s ease-in-out;
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
				<a class="navbar-brand " href="../../home.jsp">H.G.R Resort</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link" href="../../home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../Service.jsp">Service</a></li>
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
						<li class="nav-item"><a class="nav-link"
							href="../../contact.jsp">Contact</a></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><span
								class="glyphicon glyphicon-user"></span>${sessionScope.username.username}<span
								class="caret"></span> </a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../LogoutServlet">Logout</a></li>
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
		<form action="../../createContractServlet" method="get">
			<header class="heading"> Add New</header>
			<hr></hr>
			
					<div class="row2">
						<div class="col-sm-3 text-left">
							
								<label class="id " for="id">Charge Of:</label> 
						</div>
						<div class="col-sm-3">		
								<select class="form-control text-center"
									 name="id" id="id" class="form-control" required="required">
									<%
									if (!employees.isEmpty()) {
										for (Employee e : employees) {
									%>
									<option ><%=e.getId()%></option>
									<%
									}
									}
									%>
								</select>
						</div>
						

						
						<div class="col-sm-3 ">
							<label class="falname">Order By:</label>
						</div>
						<div class="col-sm-3">
							<input type="text" name="falname" id="falname"
								placeholder="Enter Your Name" class="form-control"
								required="required">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="email">Email:</label> 
						</div>
						<div class="col-sm-3">		
								<input type="email" name="email"  id="email" 
								placeholder="Enter Your Email" class="form-control" required="required">
						</div>
						

						
						<div class="col-sm-3">
							<label class="pno">Phone:</label>
						</div>
						<div class="col-sm-3">
							<input type="text" name="phonenumber" id="phonenumber"
								placeholder="Enter Your Phone Number" class="form-control"
								required="required">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="arrivaldate">Arrival:</label> 
						</div>
						<div class="col-sm-3">
								<input class="form-control text-center" type="date" placeholder="Arrival Date"
								name="arrivaldate"  id="arrivaldate" required="required">
						</div>
						
						<div class="col-sm-3">
								<label class="departuredate">Departure:</label> 
						</div>
						<div class="col-sm-3">
								<input class="form-control text-center" type="date" placeholder="Departure Date"
								name="departuredate"  id="departuredate" required="required">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="roomtype">Room Type:</label> 
						</div>
						<div class="col-sm-3">		
								<select class="form-control"
									 name="roomtype" id="roomtype" class="form-control" required="required">
									<option >Standard</option>
									<option >Double</option>
									<option >VIP</option>
								</select>
						</div>
						

						
						<div class="col-sm-3">
							<label class="totalprice">Total Price:</label>
						</div>
						<div class="col-sm-3">
							<input type="text" name="totalprice" id="totalprice"
								placeholder="Enter Total" class="form-control"
								required="required">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-2 text-left">
							<label class="gender">Gender:</label>
						</div>

						<div class="col-sm-1 male">
							<input type="radio" name="gender" id="gender" value="1"
								required="required">Male
						</div>

						<div class="col-sm-1 female">
							<input type="radio" name="gender" id="gender" value="0"
								required="required">Female
						</div>
						
						<div class="col-sm-2 text-left">
							<label class="adults">Adults:</label>
						</div>
						
						<div class="col-xs-2">
							<input aria-label="quantity" class="form-control text-center" max="10" min="0" 
							name="adults" type="number" id="adults" placeholder="Amount" value="0" required>
						</div>
						
						<div class="col-sm-2 text-left">
							<label class="children">Children:</label>
						</div>
						
						<div class="col-xs-2">
							<input aria-label="quantity" class="form-control text-center" max="10" min="0" 
							name="children" type="number" id="children" placeholder="Amount" value="0" required>
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3">
								<label class="category">Category:</label> 
						</div>
						<div class="col-sm-5">		
								<input type="text" name="category"  id="category" 
								placeholder="Enter Category " class="form-control">
						</div>
				</div>
				<div class="row2">
						<button type="submit" class="btn btn-warning">Submit</button>
				</div>
			
		</form>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>

