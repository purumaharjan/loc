<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<script type="text/javascript" src="/locksA2Z/resources/js/checkboxAction.js"></script>
</head>
<body>
	<h2>List of all Admins</h2>
	<div class="message">${message}</div>
	<form name="listForm">
		<table border="0" align="left" cellpadding="3" cellspacing="1"
			bgcolor="#E2E3E4" width="590px">
			<tr>
				<th><input type="checkbox" name="checkAllPtr"
					onclick="CheckAll(document.listForm.selected)" />
				</th>
				<th align="left">Admin Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="baseEntity" items="${baseEntities}">
				<tr>
					<td><input type="checkbox" name="selected"
						value="${baseEntity.id}" />
					</td>
					<td align="left">${baseEntity.name}</td>
					<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
						<td><a
							href="managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=edit&id=${baseEntity.id}&paging=${currentPage}"><img
								src="../resources/images/icon_edit.gif" width="15" height="15"
								border="none"> </a></td>
					</security:authorize>
					<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
						<td><img src="../resources/images/icon_edit.gif" width="15"
							height="15">
						</td>
					</security:authorize>

					<security:authorize
						ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
						<td><a
							href="managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=delete&id=${baseEntity.id}&paging=${currentPage}"><img
								src="../resources/images/icon_remove.gif" width="13" height="13"
								border="none"> </a></td>
					</security:authorize>
					<security:authorize
						ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
						<td><img src="../resources/images/icon_remove.gif" width="13"
							height="13">
						</td>
					</security:authorize>

				</tr>
			</c:forEach>
		</table>
	</form>
	<div style="float: left">
		<table>
			<tr>
				<td><security:authorize
						ifAllGranted="ROLE_Manage${pageToDisplay}Add">
						<div class="boxBotton">
							<a href="manage.htm?page=ROLE_Manage${pageToDisplay}&task=add&paging=1">Add
								User +</a>
						</div>
					</security:authorize> <security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
						<div class="boxBotton">
							<a href="#">Add User +</a>
						</div>
					</security:authorize></td>
				<td>
					<form name="deleteForm" action="DeletionTaskUsers.htm" method="post">
						<input type="hidden" name="list" />
						<input type="hidden" name="pageToDisplay" value="${pageToDisplay}" />
					</form>
					<security:authorize
						ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
						<div class="boxBotton">
							<a href="#" onclick="getAllCheck(document.listForm.selected);if(addToList(document.deleteForm.list)) document.deleteForm.submit();">Delete
								Selected +</a>
						</div>
					</security:authorize> <security:authorize
						ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
						<div class="boxBotton">
							<a href="#">Delete Selected +</a>
						</div>
					</security:authorize></td>
			</tr>
		</table>
	</div>
	<%@ include file="../../pagination.jsp" %>
</body>
</html>