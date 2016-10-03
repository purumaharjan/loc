<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<body>
<h1>
Manage Orders
</h1>
<c:choose>
		<c:when test="${task=='list'}">
			<jsp:include page="adminOrdersList.jsp" />
		</c:when>
		<c:when test="${task=='productList'}">
			<jsp:include page="adminOrdersProductList.jsp" />
		</c:when>

	</c:choose>
</body>
</html>
