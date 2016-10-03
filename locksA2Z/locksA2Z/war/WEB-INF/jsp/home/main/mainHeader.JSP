<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%@ page
	import="org.springframework.security.core.AuthenticationException"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<div class="headerleft">
		<div class="topmenu">
			<a href="registration.htm">Register </a>
		</div>
	</div>

	<div class="login">
		<form:form action="j_spring_security_check" method="POST">
			<div class="login_box">
				<div class="username">
					<input id="j_username" name="j_username" type="text" />
				</div>
				<div>
					<input id="j_password" name="j_password" type="password" />
				</div>
				<div class="remain_box">
					<a href="#">remember for me </a><br> <a href="#">forgot ?</a>
				</div>
				<div class="go_btn">
					
				</div>

				<div class="clear"></div>
			</div>
		</form:form>
	</div>
	<div class="header_right"></div>
	<div class="clear"></div>
</body>
</html>