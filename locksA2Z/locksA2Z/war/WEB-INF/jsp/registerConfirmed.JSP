<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
<title>Registration Confirmed</title>
</head>
<body>
<body class="body">
	<div class="wrapper">
		<div class="loginHeader"></div>
		<div class="registerContainer">
			<h2>Successfully Registered</h2>
			</br>
			<h4>You have ${message} with following information</h4>
					</br>
					<div class="username">
						<label>Full Name:${customer.name}</label>
					</div>
					<div class="username">
						<label>User Name:${customer.username}</label>
					</div>
					<div class="username">
						<label>Email Address:${customer.email}</label>
					</div>
					<div class="username">
						<label>Phone No:${customer.phoneNo}</label>
					</div>
					<div class="username">
						<label>Address:${customer.address}</label>
					</div>
					<div class="username">
						<label>State/Region:${customer.province}</label>
					</div>
					<div class="username">
						<label>Country:${customer.country}</label>
					</div>
					<h4><a href="home.htm">Click Here</a> to Login</h4>
		</div>
	</div>
</body>
</html>