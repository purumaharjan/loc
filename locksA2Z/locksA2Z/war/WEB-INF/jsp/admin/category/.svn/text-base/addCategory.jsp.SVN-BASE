<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<META http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
</head>
<script type="text/javascript">
	function enableDisableCategoryList() {
		if (document.addCategoryForm.isRoot.checked)
			document.getElementById("categoryName").disabled = true;
		else if (!document.addCategoryForm.isRoot.checked) {
			document.getElementById("categoryName").disabled = false;
			//set value null to selectCategory		
			//document.getElementById("categoryName").value="null";
		}
	}
</script>

<body>

	<div>
		<form:form name="addCategoryForm" action="addCategorySubmit.htm"
			method="POST" commandName="category">
			<c:if test="${not empty category.name}">
				<form:hidden path="id" />
				<hidden name="categoryParentId" value="${categoryParentId.id}" />
			</c:if>

			<div class="username">
				<div class="labelTxtBox">
					<label>Choose Category:</label>
				</div>
				<form:select path="categoryParentId.name" name="categoryName"
					id="categoryName" disabled="true" class="textbox">
					<option>Select category</option>
					<c:forEach var="allCategories" items="${allCategories}">
						<option>${allCategories.name}</option>
					</c:forEach>
				</form:select>
			</div>


			<div class="username">
				<div class="labelTxtBox">
					<label>Category Name:</label>
				</div>
				<div class="textbox">
					<form:input id="categoryName" path="name" />
				</div>
				<input name="isRoot" id="isRoot" checked="true" type="checkBox"
					value="Root" onclick="enableDisableCategoryList()" /> <label>isRoot</label>

			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Description:</label>
				</div>
				<div class="textbox">
					<form:input id="categoryDescription" path="categoryDescription" />
				</div>
			</div>
			<div class="submit">
				<input id="addCategoryBtn" type="submit" value="" />
			</div>
		</form:form>
	</div>

</body>
</html>