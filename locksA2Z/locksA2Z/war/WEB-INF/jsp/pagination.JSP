<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<script language="JavaScript">
	<%@ include file="/resources/js/pagination.js" %>	
</script>
</head>
<body>
	<table id="dataTable">
		 <tr>
		    <td><a href="javascript:paging('dataTable','manage.htm?page=ROLE_Manage${pageToDisplay}&task=list&paging=','${currentPage-1}','${maxPageSize}')">Previous</a></td>
		    <c:forEach var="num" begin="1" end="${maxPageSize}">
		    	<td><a href="manage.htm?page=ROLE_Manage${pageToDisplay}&task=list&paging=${num}"><c:out value="${num}"/></a></td>
            </c:forEach>
	      	<td><a href="javascript:paging('dataTable','manage.htm?page=ROLE_Manage${pageToDisplay}&task=list&paging=','${currentPage+1}','${maxPageSize}')">Next</a></td>
		 </tr>		
	</table>
</body>
</html>