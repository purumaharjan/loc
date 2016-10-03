<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<c:url value="/logout" var="logoutUrl" />
 <div class="login">
	<div class="topmenu"><security:authentication property="name" /> &nbsp;|&nbsp; <a href="${logoutUrl}">Logout</a> </div>
	</div>
	
	
</body>
</html>