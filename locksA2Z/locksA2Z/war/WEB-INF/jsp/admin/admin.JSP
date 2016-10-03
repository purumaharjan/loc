<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/style/admin.css"
	type="text/css" />
<title>Admin Page</title>
</head>

<body>
	<div class="wrapper">
		<div class="headerleft">
			<div class="logoPart">
				<div class="logo">
					<img src='../resources/images/logo.gif'>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header_shadow"></div>
		</div>

		<div class="adminHeader">
			<jsp:include page="adminHeader.jsp" />
		</div>
		<div class="content">
			<div class="adminNavigationalPanel">
				<jsp:include page="adminNavigation.jsp" />
			</div>
			<div class="clear"></div>
			<div class="content_right">
				<c:choose>
					<c:when test="${pageToDisplay=='AdminsUsers'}">
						<jsp:include page="adminsusers/adminAdminsUsers.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='Inventory'}">
						<jsp:include page="inventory/adminInventory.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='Roles'}">
						<jsp:include page="roles/adminRoles.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='Product'}">
						<jsp:include page="product/adminProduct.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='Orders'}">
						<jsp:include page="orders/adminOrders.jsp" />
					</c:when>
					<c:when test="${pageToDisplay=='Category'}">
						<jsp:include page="category/adminCategory.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include page="adminhome.jsp" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="clear"></div>
		<DIV class="content_footer"></DIV>
		<div class="footer">@copyright locksa2z 2011</div>
	</div>
</body>
</html>
