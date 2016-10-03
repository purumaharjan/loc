<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/style/main.css" type="text/css" />
<title>Locks A2Z HomePage</title>
</head>

<body>
	<DIV class="wrapper">
		<DIV class="header">
			<jsp:include page="mainHeader.jsp" />
		</DIV>

		<DIV class="content">
			<div class="content_left">
				<jsp:include page="mainNavigation.jsp" />			
			</div>
			<div class="content_right">		
			    <c:choose>
					<c:when test="${pageToDisplay=='home'}">
						<jsp:include page="mainContent.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='orderList'}">
						<jsp:include page="cart.jsp" />
					</c:when>
				</c:choose>
			</div>
		</DIV>
		<div class="clear"></div>
		<DIV class="content_footer"></DIV>
		<jsp:include page="mainFooter.jsp" />
	</DIV>
</body>
</html>