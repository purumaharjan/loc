<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<script type="text/javascript" src="/locksA2Z/resources/js/highslide-with-html.js"></script>
<script type="text/javascript">
    hs.graphicsDir = '/locksA2Z/resources/js/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
</script>
<link rel="stylesheet" href="/locksA2Z/resources/style/ajaxStyle.css" type="text/css" />
<body>
	<table border="0" align="left" cellpadding="3" cellspacing="1"
		bgcolor="#E2E3E4" width="590px">
		<tr>
			<th align="left">Product BarCode ID</th>
			<th align="left">Name</th>
			<th align="left">Quantity</th>
			<th align="left">Price/Quantity</th>
			<th align="left">View Details</th>
		</tr>
		<c:forEach var="inventory" items="${inventories}">
			<tr>
				<td align="left">${inventory.productBarCodeId}</td>
				<td align="left">${inventory.name}</td>
				<td align="left">${inventory.productQuantity}</td>
				<td align="left">${inventory.productPrice}</td>
				<td align="left"><a
				href="displayProductDetails.htm?productId=${inventory.id}" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><img
					src="../resources/images/icon_view.jpg" width="37" height="40"
					border="none" /></a>
				</td>				
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../pagination.jsp" %>
</body>
</html>