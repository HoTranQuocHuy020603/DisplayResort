<%@ page import="java.util.List"%>
<%@ page import="example.dao.ContractDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Contract Page</title>

	<%@include file="/includes/head.jsp"%>
	<!--Fontawesome CDN-->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="icon" type="image/png" href="../../image/favicon.ico" />	
<style>

.bg-img {
	background-image: url('image/quayletan.jpg');
	background-repeat:no-repeat;
	background-size:cover;
	width:100%;
	height:100vh;
	overflow:auto;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

.h3{
   color:white;
}

.table {
    background-color: #a3b4cd;
    width: 95%;
    margin-bottom: 7rem;
    margin-left: auto;
    margin-right: auto;
}

.thead-light{
   background-color: #ffd9d9 ;
}

.text-left {
    text-align: right!important;
    margin-right: 5%;
}

.fa-mars { 
	color:blue; 
}

.fa-venus { 
	color:pink; 
}

.fa-edit { 
	color:green; 
}

.fa-trash-alt { 
	color:red; 
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
								<li class="nav-item"><a class="nav-link" 
								    href="readContractServlet">Contract</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><span
								class="fas fa-user"></span>${sessionScope.username.username}<span
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
		<form class="form-inline" action="searchContractServlet" method="post">
			<div class="input-group">
				<input type="search" name="txtSearchValue" value="${param.txtSearchValue}" class="form-control" size="50"
					placeholder="Enter the word you want to search" >
				<div class="input-group-btn">
					<button type="submit" class="btn btn-danger">Search</button>
				</div>
			</div>
		</form>
	</div>
	
    <div class="container-fluid">
		<div class="row">
			<div class="text-center"
				style="font-size: 150%; font-family: serif; padding: 10px 250px;">
				<p style="font-family: fantasy;">Contract registration process: </p>
                <p>    Customers must use email and phone number that are real and in use.</p>
                <p>    After signing, staff will notify customers by email and phone to notify about successful contract or incident.</p>
                <p>    NOTE: Customers should pay attention to avoid confusion or errors.</p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="container bg-img">
			<h3 class="text-center h3">List of Contract</h3>
			<hr>			
			<div class="container text-left">
				<a href="pages/contract/CreateContract.jsp" class="btn btn-success">Add
					New</a>				
			</div>
			<br>
			<table class="table table-bordered">			
				<thead class="thead-light">
					<tr >
						<th style= "vertical-align: middle;" class="text-center">Id</th>
						<th style= "vertical-align: middle;" class="text-center">Charge Of</th>
						<th style= "vertical-align: middle;" class="text-center">Order By</th>
						<th style= "vertical-align: middle;" class="text-center">Email</th>
						<th style= "vertical-align: middle;" class="text-center">Phone Number</th>
						<th style= "vertical-align: middle;" class="text-center">Gender</th>
						<th style= "vertical-align: middle;" class="text-center">Arrival Date</th>
						<th style= "vertical-align: middle;" class="text-center">Departure Date</th>
						<th style= "vertical-align: middle;" class="text-center">Adults</th>
						<th style= "vertical-align: middle;" class="text-center">Children</th>
						<th style= "vertical-align: middle;" class="text-center">Room Type</th>
						<th style= "vertical-align: middle;" class="text-center">Total Price ($)</th>
						<th style= "vertical-align: middle;" class="text-center">Category</th>
						<c:if test="${sessionScope.username.isEmployee == true }">
						<th class="text-center">Actions</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="con" items="${listContract}">

						<tr>
							<td style= "vertical-align: middle;" class="text-center">${con.cid}</td>
							<td style= "vertical-align: middle;" class="text-center">${con.id}</td>
							<td style= "vertical-align: middle;" class="text-center">${con.falname}</td>
							<td style= "vertical-align: middle;" class="text-center">${con.email}</td>
							<td style= "vertical-align: middle;" class="text-center">${con.phonenumber}</td>
							<td style= "vertical-align: middle;" class="text-center">
							    <c:if test="${con.gender == 1}"><i class="fas fa-mars"></i></c:if> 
							
							    <c:if test="${con.gender == 0}"><i class="fas fa-venus"></i></c:if>
						    </td>
						    <td style= "vertical-align: middle;" class="text-center">${con.arrivaldate}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.departuredate}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.adults}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.children}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.roomtype}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.totalprice}</td>
						    <td style= "vertical-align: middle;" class="text-center">${con.category}</td>
						    <c:if test="${sessionScope.username.isEmployee == true }">
							<td class="text-center"><a href="updateContractServlet?cid=${con.cid}"><i class="fas fa-edit"></i></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" onclick="showMess(${con.cid})"><i class="fas fa-trash-alt"></i></a>
							</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	<script>
           function showMess(cid){
	          var option = confirm('Are you sure to delete this persion!!!');
	          if(option===true){
		            window.location.href = 'deleteContractServlet?cid='+cid;
	            }
	
             }
    </script>
<%@include file="/includes/footer.jsp"%>
</body>
</html>
