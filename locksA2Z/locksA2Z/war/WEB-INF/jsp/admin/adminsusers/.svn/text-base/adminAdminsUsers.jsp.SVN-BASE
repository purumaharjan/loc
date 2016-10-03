<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<h1>Manage Admins/Users</h1>
	<c:choose>
		<c:when test="${task=='list'}">
			<jsp:include page="adminAdminsUsersList.jsp" />
		</c:when>
		<c:when test="${task=='edit'}">
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
				<jsp:include page="adminAdminsUsersAdd.jsp" />
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
				<jsp:include page="adminAdminsUsersList.jsp" />
			</security:authorize>
		</c:when>
		<c:when test="${task=='delete'}">
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
				<jsp:include page="adminAdminsUsersList.jsp" />
			</security:authorize>
		</c:when>
		<c:when test="${task=='add'}">
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Add">
				<jsp:include page="adminAdminsUsersAdd.jsp" />
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
				<jsp:include page="adminAdminsUsersList.jsp" />
			</security:authorize>
		</c:when>
	</c:choose>
</body>
</html>