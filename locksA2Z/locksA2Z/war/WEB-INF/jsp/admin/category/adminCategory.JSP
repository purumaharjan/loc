<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${task=='list'}">
		<jsp:include page="displayCategory.jsp" />
	</c:when>
	<c:when test="${task=='addCategory'}">
		<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Add">
			<jsp:include page="addCategory.jsp" />
		</security:authorize>
		<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
			<jsp:include page="displayCategory.jsp" />
		</security:authorize>
	</c:when>
	<c:when test="${task=='editCategory'}">
		<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
			<jsp:include page="addCategory.jsp" />
		</security:authorize>
		<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
			<jsp:include page="displayCategory.jsp" />
		</security:authorize>
	</c:when>
	<c:when test="${task=='delete'}">
		<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
			<jsp:include page="displayCategory.jsp" />
		</security:authorize>
	</c:when>
</c:choose>
</body>
</html>