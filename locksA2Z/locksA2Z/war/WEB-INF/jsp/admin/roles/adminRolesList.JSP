<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<script type="text/javascript" src="/locksA2Z/resources/js/checkboxAction.js"></script>
</head>
<body>
	<h2>List of Roles</h2>
	<div class="message">${message}</div>
	<form name="listForm">
		<table border="0" align="left" cellpadding="3" cellspacing="1"
			bgcolor="#E2E3E4" width="600px">
			<tr>
				<th><input type="checkbox" name="checkAllPtr"
					onclick="CheckAll(document.listForm.selected)">
				</th>
				<th align="left">ID</th>
				<th align="left">Role</th>
				<th align="left">Permission</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="role" items="${availableRoles}">
				<tr>
					<td><input type="checkbox" name="selected" value="${role.id}" />
					</td>
					<td align="left">${role.id}</td>
					<td align="left">${role.name}</td>
					<td align="left"><select style="width: 250px">
							<c:forEach var="permission" items="${role.permissions}">
								<c:choose>
									<c:when
										test="${permission.id==permission.parentPermission.id && permission.id!=1}">
										<option>${fn:toUpperCase(permission.name)}</option>
										<c:forEach var="childPermission" items="${role.permissions}">
											<c:if
												test="${childPermission.parentPermission.id==permission.id && childPermission.id!=permission.id}">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${childPermission.name}</option>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>
					</select></td>
					<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
						<td><a
							href="managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=edit&id=${role.id}&paging=${currentPage}">
								<img src="../resources/images/icon_edit.gif" width="15"
								height="15" border="none"> </a>
						</td>
					</security:authorize>
					<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
						<td><img src="../resources/images/icon_edit.gif" width="15"
							height="15">
						</td>
					</security:authorize>

					<security:authorize
						ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
						<td><a
							href="managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=delete&id=${role.id}&paging=${currentPage}">
								<img src="../resources/images/icon_remove.gif" width="13"
								height="13" border="none"> </a>
						</td>
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
							<a
								href="manage.htm?page=ROLE_Manage${pageToDisplay}&task=add&paging=${currentPage}">Add
								Role+</a>
						</div>
					</security:authorize> <security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
						<div class="boxBottton">
							<a href="#">Add Role+</a>
						</div>
					</security:authorize>
				</td>
				<td>
					<form name="deleteForm" action="deleteRole.htm" method="post">
						<input type="hidden" name="list" /> <input type="hidden"
							name="pageToDisplay" value="${pageToDisplay}" /> <input
							type="hidden" name="paging" value="${currentPage}" />
					</form> <security:authorize
						ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
						<div class="boxBotton">
							<a href="#"
								onclick="getAllCheck(document.listForm.selected); if(addToList(document.deleteForm.list)) document.deleteForm.submit();">Delete
								Role-</a>
						</div>
					</security:authorize> <security:authorize
						ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
						<div class="boxBottton">
							<a href="#">Delete Role-</a>
						</div>
					</security:authorize>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="../../pagination.jsp" %>
</body>
</html>