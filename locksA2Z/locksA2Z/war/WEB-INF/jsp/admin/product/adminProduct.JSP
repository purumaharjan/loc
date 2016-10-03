<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<html>
<body>
	<h1>Welcome to Product section</h1>
	<h2>Manage Products</h2>
	<c:choose>
		<c:when test="${task=='list'}">
			<jsp:include page="displayProduct.jsp" />
		</c:when>
		<c:when test="${task=='addProduct'}">
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Add">
				<jsp:include page="addProduct.jsp" />
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
				<jsp:include page="displayProduct.jsp" />
			</security:authorize>
		</c:when>
		<c:when test="${task=='editProduct'}">
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
				<jsp:include page="addProduct.jsp" />
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
				<jsp:include page="displayProduct.jsp" />
			</security:authorize>
		</c:when>
		<c:when test="${task=='delete'}">
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
				<jsp:include page="displayProduct.jsp" />
			</security:authorize>
		</c:when>
	</c:choose>
</body>
</html>