<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%@ page
	import="org.springframework.security.core.AuthenticationException"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
<title>Login</title>
</head>

<body class="body">
	<div class="loginHeader"></div>
	<div class="loginContainer">

		<div class="loginText">
			<label>Login</label>
		</div>

		<div class="logoutText">${logout}</div>

		<form:form action="j_spring_security_check" method="POST">

			<div class="username">
				<div class="labelTxtBox">
					<label>Username:</label>
				</div>
				<div class="textbox">
					<input id="j_username" name="j_username" type="text" />
				</div>
			</div>

			<div class="password">
				<div class="labelTxtBox">
					<label>Password:</label>
				</div>
				<div class="textbox">
					<input id="j_password" name="j_password" type="password" />
				</div>
			</div>
			<div class="submit">
				<input id="loginBtn" type="submit" value="" />
			</div>
			<div class="forgetRememberRegisterContainer">
				<div class="userCheckBox">
					<input type="checkbox" id="_spring_security_remember_me"
						name="_spring_security_remember_me" value="on" /> <label
						class="label">Remember me</label>
				</div>
				<div class="forgotPassword">
					<a href="forgotPassword">Forgot Password?</a>
				</div>
				<div class="register">
					<a href="registration.htm">Register?</a>
				</div>

			</div>

		</form:form>

	</div>

	<div class="footer">@copyright locksa2z 2011</div>

</body>
</html>