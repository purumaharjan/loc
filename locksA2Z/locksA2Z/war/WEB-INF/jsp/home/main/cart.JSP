<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/style/main.css" type="text/css" />
<script language="JavaScript">
	<%@ include file="/resources/js/customer.js" %>	
</script>
</head>
<body>
    <table id="dataTable" border="0" align="left" cellpadding="3" cellspacing="1"
		bgcolor="#E2E3E4" width="590px">
        <tr>
            <th><input type="checkbox" name="chk"/></th>
            <th>ProductName</th>
            <th>ProductCost</th>
            <th>ProductQuantiy</th>
            <th>ProdcutImage</th>
            <th>ProductCategory</th>
            <th>Remove</th>
        </tr>
        <c:forEach var="productList" items="${orders.orderProducts}">
        	<tr>
        		<td><input type="checkbox" name="chk"/></td>
        		<td>${productList.name}</td>
        		<td>${productList.productPrice}</td>
        		<td>${productList.productQuantity}</td>
        		<td>${productList.productImage}</td>
        		<td>${productList.category.id}</td>
        				<td><a href="#"><img
							src="../resources/images/icon_remove.gif" width="13" height="13" border="none">
					</a></td>
        	</tr>
        </c:forEach>
    </table>

</body>
</html>