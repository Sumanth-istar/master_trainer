<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="/img/user_images/recruiter_portal_trans_logo.png" />
<title>Talentify | Login</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">

</head>

<body class="gray-bg"
	style="background-size: cover; background-repeat: no-repeat; background-image: url('../assets/images/demo.png')">

	<div class="text-center loginscreen animated fadeInDown">


		<div class="login-screen-box">
			<div>
				<img alt="Talentify"
					src="<%=baseURL %>img/user_images/recruiter_portal_trans_logo.png" width="60%"
					height="60%">
			</div>

			<br>

			<h2 style="font-weight: 700;">Welcome To Trainer Portal</h2>
			
			<br>
			<form class="m-t" role="form" action="/master_trainer/login" method="get">
				
				<div class="form-group">
					<input type="email" name="email" value="vinay_sales@istarindia.com"
						class="form-control email" placeholder="Username" required="">
				</div>
				<div class="form-group">
					<input type="password" name="password" value="test123" 
						class="form-control password" placeholder="Password" required="">
				</div>
                               
				 <button type="submit" style="font-weight: 600; font-size: 16px"
					class="btn btn-primary block full-width m-b login-button">Login</button> 

			<a href="/master_trainer/signup_form.jsp">Create New User</a>
			</form>

			<p class="m-t">
				<small>ISTAR Skill Development Pvt. Ltd. &copy; 2017</small>
			</p>
		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	$( document ).ready(function() {
	   
		
	});
	
	</script>
</body>

</html>
