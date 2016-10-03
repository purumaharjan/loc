<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<script type="text/javascript" src="/locksA2Z/resources/js/jquery.js"></script>
<script type="text/javascript" src="/locksA2Z/resources/js/ajax.js"></script>
<script language="JavaScript">
	<%@ include file="/resources/js/pagination.js" %>	
</script>
<script type="text/javascript"
	src="/locksA2Z/resources/js/checkboxAction.js"></script>
<script type="text/javascript">
function displaySubCategory(id,page){
	document.getElementById("categoryId").value=id;
	document.getElementById("paging").value=page;
}
</script>

</head>
<body>
<h2>CategoryList</h2>
<div class="message">${message}</div>
<c:if test="${not empty category.name}">
	<div align="left"><label><a
		href="manage.htm?page=ROLE_ManageCategory&task=list&paging=1"><b>ROOT</b>
	</a> > <c:forEach var="parentCategory" items="${parentCategories}">
		<a
			﻿onclick="displaySubCategory(${parentCategory.id});document.listSubCategories.submit()"
			﻿style="cursor: pointer"><b>${parentCategory.name}</b> </a> >
						</c:forEach> ${category.name} > </label></div>
	<br />
</c:if>
<form name="listSubCategories" action="dropSubCategoryToTable.htm"
	method="GET"><input type="hidden" id="categoryId"
	name="categoryId" /> <input type="hidden" id="paging" name="paging" />
</form>
<input type="hidden" id="currentId" name="currentId" />
<form name="listForm">
<table border="0" align="left" cellpadding="3" cellspacing="1"
	bgcolor="#E2E3E4" width="590px">
	<tr>
		<th><input type="checkbox" name="checkAllPtr"
			onclick="CheckAll(document.listForm.selected)" /></th>
		<th align="left">CategoryName</th>
		<th>SubCategoryName</th>
		<th align="left">CategoryDescription</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach var="availableCategory" items="${availableCategories}">
		<tr>
			<td><input type="checkbox" name="selected"
				value="${availableCategory.id}" /></td>
			<td align="left">${availableCategory.name}</td>
			<td><select id="${availableCategory.id}" style="width: 120px;"
				onclick="loadSubcategory(${availableCategory.id})"
				onchange="displaySubCategory(${availableCategory.id},1);document.listSubCategories.submit()">
				<option id="optdesc" value="">Select a SubCategory</option>
			</select></td>
			<td align="left">${availableCategory.categoryDescription}</td>
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Edit">
				<td><a
					href="updateCategory.htm?page=ROLE_Manage${pageToDisplay}&task=editCategory&categoryId=${availableCategory.id}&paging=${currentPage}"><img
					src="../resources/images/icon_edit.gif" width="15" height="15"
					border="none" /> </a></td>
			</security:authorize>
			<security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Edit">
				<td><img src="../resources/images/icon_edit.gif" width="15"
					height="15"></td>
			</security:authorize>
			<security:authorize ifAllGranted="ROLE_Manage${pageToDisplay}Delete">
				<td><a
					href="deleteCategory.htm?categoryId=${availableCategory.id}"><img
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
				href="addCategory.htm?page=ROLE_Manage${pageToDisplay}&task=addCategory">Add
			Category +</a></div>
		</security:authorize> <security:authorize ifNotGranted="ROLE_Manage${pageToDisplay}Add">
			<div class="boxBotton"><a href="#">Add Category +</a></div>
		</security:authorize>
		</td>		
		<td>
		<form name="deleteForm" action="DeletionTaskCategories.htm" method="post">
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
<table id="dataTable">
	<tr>
		<td><a
			href="javascript:paging('dataTable','manage.htm?page=ROLE_Manage${pageToDisplay}&task=list&paging=','${currentPage-1}','${maxPageSize}')">Previous</a>
		</td>
		<c:forEach var="num" begin="1" end="${maxPageSize}">
			<td><a
				onclick="displaySubCategory(${currentId},${num});document.listSubCategories.submit()"><c:out
				value="${num}" /> </a></td>
		</c:forEach>
		<td><a
			href="javascript:paging('dataTable','manage.htm?page=ROLE_Manage${pageToDisplay}&task=list&paging=','${currentPage+1}','${maxPageSize}')">Next</a>
		</td>
	</tr>
</table>
</body>
</html>