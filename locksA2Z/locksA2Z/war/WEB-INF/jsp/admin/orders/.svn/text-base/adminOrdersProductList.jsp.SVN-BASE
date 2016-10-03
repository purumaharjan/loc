<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<META http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
</head>
<script language="JavaScript">
	
<%@ include file="/resources/js/checkList.js" %>
	
</script>
<body>

<h2>Ordered By: ${orders.user.name}</h2>

<table id="dataTable"  border="0" align="left" cellpadding="3" cellspacing="1"
		bgcolor="#E2E3E4" width="590px">
	<tr>
		<th align="left">ProductId</th>
		<th align="left">ProductCategory</th>
		<th align="left">ProductName</th>
		<th align="left">ProductPrice</th>
		<th align="left">ProductQuantity</th>
		<th align="left">Total</th>
	</tr>
	<c:forEach var="orderProduct" items="${orders.orderProducts}">
		<tr>
			<td align="left">${orderProduct.id}</td>
			<td align="left">${orderProduct.category.name}</td>
			<td align="left">${orderProduct.name}</td>
			<td align="left">${orderProduct.productPrice}</td>
			<td align="left">${orderProduct.productQuantity}</td>
		</tr>
	</c:forEach>
	


			<form:form action="updateOrderStatus.htm" method="POST"
				commandName="orders">
	
				<form:hidden path="id" value="${orders.id}" />

				<table>
					<tr>
						<td>DeliverStatus</td>
						<td>
							
								${orders.orderStatus}
							
						</td>
					</tr>
					<tr>
						<td>GrandTotal</td>
						<td>
							0.00
						</td>
					</tr>
				    <tr>    
						<td>
							<div class="boxBotton">
								<a href="updateOrderStatus.htm?page=ROLE_ManageOrders&task=productList&id=${orders.id}&orderStatus=ordered&paging=${currentPage}">ordered</a>
							</div>
						</td>
						<td>
							<div class="boxBotton">
								<a href="updateOrderStatus.htm?page=ROLE_ManageOrders&task=productList&id=${orders.id}&orderStatus=process&paging=${currentPage}">process</a>
							</div>
						</td>
						<td>
							<div class="boxBotton">
								<a href="updateOrderStatus.htm?page=ROLE_ManageOrders&task=productList&id=${orders.id}&orderStatus=delivered&paging=${currentPage}">delivered</a>
							</div>
						</td>
	
					</tr>
				</table>
			</form:form>
	</table>
</body>
</html>
