<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<table border="0" cellpadding="3" cellspacing="1" style="text-align: left;padding-left:10px;">
	<tr>
		<c:if test="${not empty product.productImage}">
			<img src="../resources/images/${product.productImage}" style="float:left;margin-top:5px;"></img>
		</c:if>
	</tr>
	<tr>
		<th>Product BackSets</th>
		<td>${product.productBackSets}</td>
	</tr>
	<tr>
		<th>Product Description</th>
		<td>${product.productDescription}</td>
	</tr>
	<tr>
		<th>Product FinishColor</th>
		<td>${product.productFinishColor}</td>
	</tr>
	<tr>
		<th>Product Grade</th>
		<td>${product.productGrade}</td>
	</tr>
	<tr>
		<th>Product KeyTypes</th>
		<td>${product.productKeyTypes}</td>
	</tr>
	<tr>
		<th>Product LeverDesign</th>
		<td>${product.productLeverDesign}</td>
	</tr>
	<tr>
		<th>Product Price</th>
		<td>${product.productPrice}</td>
	</tr>
	<tr>
		<th>Product Quantity</th>
		<td>${product.productQuantity}</td>
	</tr>
	<tr>
		<th>Product Type</th>
		<td>${product.productType}</td>
	</tr>
</table>
</body>
</html>