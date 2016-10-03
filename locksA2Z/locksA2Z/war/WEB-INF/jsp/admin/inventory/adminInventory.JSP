<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<h1>Welcome to Inventory section</h1>
	<c:choose>
		<c:when test="${task=='list'}">
			<jsp:include page="adminInventoryList.jsp" />
		</c:when>
		<c:when test="${task=='viewDescription'}">
			<jsp:include page="editInventory.jsp" />
		</c:when>
	</c:choose>
</body>
</html>
