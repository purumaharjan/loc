<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<body>
 <div class="content_left">
   <div class="leftnav">
   <div><img src="../resources/images/manage_txt.gif"></div>
	<c:forEach var="rootPermission" items="${rootPermissions}">
		<c:if test="${rootPermission.name!='ROLE_Admins'}">
			<security:authorize ifAllGranted="${rootPermission.name}">
				<div class="boxBotton">
                <a href="manage.htm?page=${rootPermission.name}&task=list&paging=1">${rootPermission.detailName}</a>
				</div>
			</security:authorize>
		</c:if>
	</c:forEach>
    </div>
    </div>
</body>
</html>
