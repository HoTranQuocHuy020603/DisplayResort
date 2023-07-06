<%@ page import="java.util.List"%>
<%@ page import="example.dao.EmployeeDao"%>
<%@ page import="example.connection.DbCon"%>
<%@ page import="example.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
EmployeeDao ed = new EmployeeDao();
List<Employee> employees = ed.selectAllEmployee();
%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Page of Edit Contract</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="../../image/favicon.ico" />

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">


	<div class="containers">
		<form action="updateContractServlet" method="post">
			<header class="heading"> Updating <input name="cid" value="${contractEdit.cid}" readonly></header>
			<hr></hr>
			
					<div class="row2">
						<div class="col-sm-3 text-left">
							
								<label class="id " for="id">Charge Of:</label> 
						</div>
						<div class="col-sm-3">		
								<select class="form-control text-center"
									 name="id" id="id" class="form-control"  >
									 <option>${contractEdit.id}</option>
									<%
									if (!employees.isEmpty()) {
										for (Employee e : employees) {
									%>
									<option ><%=e.getId() %></option>
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
								 value ="${contractEdit.falname}">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="email">Email:</label> 
						</div>
						<div class="col-sm-3">		
								<input type="email" name="email"  id="email" 
								placeholder="Enter Your Email" class="form-control" 
								value ="${contractEdit.email}" >
						</div>
						

						
						<div class="col-sm-3">
							<label class="pno">Phone:</label>
						</div>
						<div class="col-sm-3">
							<input type="text" name="phonenumber" id="phonenumber" value ="${contractEdit.phonenumber}"
								placeholder="Enter Your Phone Number" class="form-control"
								>
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="arrivaldate">Arrival:</label> 
						</div>
						<div class="col-sm-3">
								<input class="form-control text-center" type="date" placeholder="Arrival Date"
								name="arrivaldate"  id="arrivaldate"  value ="${contractEdit.arrivaldate}">
						</div>
						
						<div class="col-sm-3">
								<label class="departuredate">Departure:</label> 
						</div>
						<div class="col-sm-3">
								<input class="form-control text-center" type="date" placeholder="Departure Date"
								name="departuredate"  id="departuredate"  value ="${contractEdit.departuredate}">
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3 text-left">
								<label class="roomtype">Room Type:</label> 
						</div>
						<div class="col-sm-3">		
								<select class="form-control"
									 name="roomtype" id="roomtype" class="form-control" >
									<option>${contractEdit.roomtype}</option>
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
								 value ="${contractEdit.totalprice}"> 
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-2 text-left">
							<label class="gender">Gender:</label>
						</div>

						<div class="col-sm-1 male">
							<input type="radio" name="gender" id="gender" value="1"${contractEdit.gender == 1?"checked":"" }
								>Male
						</div>

						<div class="col-sm-1 female">
							<input type="radio" name="gender" id="gender" value="0"${contractEdit.gender == 0?"checked":"" }
								>Female
						</div>
						
						<div class="col-sm-2 text-left">
							<label class="adults">Adults:</label>
						</div>
						
						<div class="col-xs-2">
							<input aria-label="quantity" class="form-control text-center" max="10" min="0" 
							name="adults" type="number" id="adults" placeholder="Amount" value ="${contractEdit.adults}" >
						</div>
						
						<div class="col-sm-2 text-left">
							<label class="children">Children:</label>
						</div>
						
						<div class="col-xs-2">
							<input aria-label="quantity" class="form-control text-center" max="10" min="0" 
							name="children" type="number" id="children" placeholder="Amount" value ="${contractEdit.children}" >
						</div>
					
				</div>
				
				<div class="row2">
						<div class="col-sm-3">
								<label class="category">Category:</label> 
						</div>
						<div class="col-sm-5">		
								<input type="text" name="category"  id="category" 
								placeholder="Enter Category " class="form-control" value ="${contractEdit.category}">
						</div>
				</div>
				<div class="row2">
						<button type="submit" onclick ="showMess()"class="btn btn-warning">Submit</button>
				</div>
			<p class="text-success">${mess}</p>
		</form>

	</div>
	
	<script>
           function showMess(){
	          var  = confirm('Chuong trinh da chay toi' +);

	
             }
    </script>
	

</body>
</html>

