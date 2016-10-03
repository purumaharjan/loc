<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
</head>
<script language="JavaScript">
	
<%@ include file="/resources/js/delete.js" %>
	
</script>
<body>
	<h2>OrderList</h2>
	<table id="dataTable" border="0" align="left" cellpadding="3" cellspacing="1"
		bgcolor="#E2E3E4" width="590px">
		<tr>
			<th align="left"></th>
			<th align="left">ID</th>
			<th align="left">OrderBy</th>
			<th align="left">OrderDeliverAddress</th>
			<th align="left">OrderDate</th>
			<th align="left">OrderDeliverCost</th>
			<th align="left">OrderStatus</th>
			<th>OrderProductList</th>
			<th>Delete</th>
			<th>
		</tr>
		<c:forEach var="orders" items="${orderEntities}">
			<tr>

				<td><input type="checkbox" name="chk" /></td>
				<td align="left">${orders.id}</td>
				<td align="left">${orders.user.name}</td>
				<td align="left">${orders.orderDeliveryAddress}</td>
				<td align="left">${orders.orderDate}</td>
				<td align="left">${orders.orderDeliveryCost}</td>
				<td align="left">${orders.orderStatus}</td>
				<security:authorize
					ifAllGranted="ROLE_Manage${pageToDisplay}ProductList">
					<td><a
						href="managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=productList&id=${orders.id}&paging=${currentPage}">ProductList</a>
					</td>
				</security:authorize>
				<security:authorize
					ifNotGranted="ROLE_Manage${pageToDisplay}ProductList">
					<td>ProductList</td>
				</security:authorize>
				<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
					<td><a href="javascript:confirmDelete('managewithid.htm?page=ROLE_Manage${pageToDisplay}&task=delete&id=${orders.id}&paging=${currentPage}')"><img
							src="../resources/images/icon_remove.gif" width="13" height="13" border="none">
					</a></td>
				</security:authorize>
				<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
					<td><img src="../resources/images/icon_remove.gif" width="13"
						height="13" border="none"></td>
				</security:authorize>
			</tr>
		</c:forEach>
	</table>
	<table>
	     <tr>
			<td>
				<div class="boxBotton">
					<a href="javascript:confirmDeleteList('dataTable','managewithidlist.htm?page=ROLE_ManageOrders&task=deleteSelected&idList=')">Delete Selected</a>
				</div>
			</td>
		 </tr>
	</table>
	<%@ include file="../../pagination.jsp" %>
</body>
</html>