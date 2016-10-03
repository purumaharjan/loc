<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<script type="text/javascript"
	src="/locksA2Z/resources/js/highslide-with-html.js"></script>
<script type="text/javascript"
	src="/locksA2Z/resources/js/checkboxAction.js"></script>
<script type="text/javascript">
    hs.graphicsDir = '/locksA2Z/resources/js/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
</script>
<link rel="stylesheet" href="/locksA2Z/resources/style/ajaxStyle.css"
	type="text/css" />
<body>
<div class="message">${message}</div>
<form name="listForm">
<table border="0" align="left" cellpadding="3" cellspacing="1"
	bgcolor="#E2E3E4" width="590px">
	<tr>
		<th><input type="checkbox" name="checkAllPtr"
			onclick="CheckAll(document.listForm.selected)" /></th>
		<th>Category</th>
		<th>Product Name</th>
		<th width="110px">Product Image</th>
		<th>View</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach var="availableProduct" items="${availableProducts}"
		varStatus="outer">
		<tr>
			<td><input type="checkbox" name="selected"
				value="${availableProduct.id}" /></td>
			<td><c:forEach var="breadCrumb" items="${breadcrumbs}"
				varStatus="inner">
				<c:if test="${inner.index==outer.index}">
						${breadCrumb}
						</c:if>
			</c:forEach></td>
			<td>${availableProduct.name}</td>
			<td><img
				src="../resources/images/${availableProduct.productImage}"></img></td>
			<td><a
				href="displayProductDetails.htm?productId=${availableProduct.id}"
				onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><img
				src="../resources/images/icon_view.jpg" width="37" height="40"
				border="none" /></a></td>
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
				<td><a
					href="updateProduct.htm?page=ROLE_Manage${pageToDisplay}&task=editProduct&productId=${availableProduct.id}"><img
					src="../resources/images/icon_edit.gif" width="15" height="15"
					border="none" /> </a></td>
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
				<td><img src="../resources/images/icon_edit.gif" width="15"
					height="15"></td>
			</security:authorize>
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
				<td><a
					href="deleteProduct.htm?productId=${availableProduct.id}"><img
					src="../resources/images/icon_remove.gif" width="15" height="15"
					border="none" /> </a></td>
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
				<td><img src="../resources/images/icon_remove.gif" width="13"
					height="13"></td>
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
			<div class="boxBotton"><a
				href="addProduct.htm?page=ROLE_Manage${pageToDisplay}&task=addProduct">Add
			Product +</a></div>
		</security:authorize> <security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
			<div class="boxBotton"><a href="#">Add Product +</a></div>
		</security:authorize></td>
		<td>
		<form name="deleteForm" action="DeletionTaskProducts.htm" method="post">
		<input type="hidden" name="list" /> <input type="hidden"
			name="pageToDisplay" value="${pageToDisplay}" /></form>
		<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
			<div class="boxBotton"><a href="#"
				onclick="getAllCheck(document.listForm.selected);if(addToList(document.deleteForm.list)) document.deleteForm.submit();">Delete
			Selected -</a></div>
		</security:authorize> <security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Delete">
			<div class="boxBotton"><a href="#">Delete Selected -</a></div>
		</security:authorize></td>
	</tr>
</table>
</div>
<%@ include file="../../pagination.jsp"%>
</body>
</html>