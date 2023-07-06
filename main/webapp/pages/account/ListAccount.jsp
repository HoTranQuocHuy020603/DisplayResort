<%@ page import="java.util.List"%>
<%@ page import="example.dao.EmployeeDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Account Page</title>


	<%@include file="/includes/head.jsp"%>
	<!--Fontawesome CDN-->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="icon" type="image/png" href="../../image/favicon.ico" />	

<style>

.bg-img {
	background-image: url('image/quayletan.jpg');
	background-repeat:no-repeat;
	background-size:cover;
	
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
    width: 75%;
    margin-bottom: 7rem;
    margin-left:150px;
}

.thead-light{
   background-color: #ffd9d9 ;
}

.text-left {
    text-align: end!important;
    margin-left:-150px;
}

.fa-check { 
	color:green; 
}

.fa-ban { 
	color:red; 
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
		
		<form class="form-inline" action="searchAccountServlet" method="post">
			<div class="input-group">
				<input type="search" name="txtSearchValue" value="${param.txtSearchValue}" class="form-control" size="50"
					placeholder="Enter the word you want to search" >
				<div class="input-group-btn">
					<button type="submit" class="btn btn-danger">Search</button>
				</div>
			</div>
		</form>

	</div>
			<h2 class="text-danger text-center">${mess}</h2>
			<h2 class="text-success text-center">${messe}</h2>
	<div class="row bg-img">
		<div class="container">
			<h3 class="text-center h3">List of Account</h3>
			<hr>	
			<div class="container text-left">
				<a href="pages/account/CreateAccount.jsp" class="btn btn-success">Add
					New</a>				
			</div>
			<br>
			<table class="table table-bordered paneltable">			
				<thead class="thead-light">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">User Name</th>
						<th class="text-center">Password</th>
						<th class="text-center">IsAdmin</th>
						<th class="text-center">IsEmployee</th>
						<th class="text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="a" items="${listAccount}">

						<tr>
							<td class="text-center">${a.id}</td>
							<td class="text-center">${a.username}</td>
							<td class="text-center">${a.password}</td>
							<td class="text-center">
							
							    <c:if test="${a.isAdmin == true}"><i class="fa fa-check"></i></c:if> 
							
							    <c:if test="${a.isAdmin == false}"><i class="fa fa-ban"></i></c:if>
							
							</td>
							<td class="text-center">
							
							    <c:if test="${a.isEmployee == true}"><i class="fa fa-check"></i></c:if> 
							
							    <c:if test="${a.isEmployee == false}"><i class="fa fa-ban"></i></c:if>
							
							</td>
							<td class="text-center">
							    <c:if test="${a.isAdmin == false || a.isEmployee == true }">
							    <a href="updateAccountServlet?id=${a.id}"><i class="fas fa-edit"></i></a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="#" onclick="showMess(${a.id})"><i class="fas fa-trash-alt"></i></a>
							    </c:if>						    
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	<script>
           function showMess(id){
	          var option = confirm('Are you sure to delete this account!!!');
	          if(option===true){
		            window.location.href = 'deleteAccountServlet?id='+id;
	            }
	
             }
    </script>
<%@include file="/includes/footer.jsp"%>
</body>
</html>
