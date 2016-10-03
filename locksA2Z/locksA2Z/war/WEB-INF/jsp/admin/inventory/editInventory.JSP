<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<META http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
</head>

<body>
	<div id="content" class="container">
		<div class="loginContainer">
			<form:form action="addInventorySubmit.htm" method="POST"
				commandName="inventory">
				<c:if test="${not empty inventory.name}">
					<form:hidden path="id" value="${inventory.id}" />
				</c:if>
				<div class="userName">
					<label class="label">Product Name:</label>
					<form:input id="productName" path="name" value="${inventory.name}" />
				</div>
				<div class="userPassword">
					<label class="label">Quantity:</label>
					<form:input id="productQuantity" path="productQuantity"
						value="${inventory.productQuantity}" />
				</div>
				<div class="loginButton">
					<input id="addInventoryBtn" type="submit" value="Submit" />
				</div>

			</form:form>
		</div>
	</div>
</body>
</html>