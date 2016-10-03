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
	<%@ include file="/resources/js/pagination.js" %>	
</script>
</head>
<body>
	<c:forEach var="catagoryList" items="${productList}">
		<td>
			<div class="content_nav">
				<div class="content_slide">
					<div class="img">
						<img src="resources/images/thumbnails.jpg">
					</div>
					<div class="content">
						<span class="title">${catagoryList.category.id}</span>
						<br>${catagoryList.name}
						<br><a href="#">BUY</a>		
					</div>					
					<div class="more">
						<a href="#"><img border="0" src="resources/images/more_btn.gif"></a>
					</div>
				</div>	
			</div>
		</td>
	</c:forEach>
	<table id="dataTable">
		<tr>
		    <td><a href="javascript:paging('dataTable','productList.htm?page=home&id=${categoryId}&paging=','${currentPage-1}','${maxPageSize}')">Previous</a></td>
		    <c:forEach var="num" begin="1" end="${maxPageSize}">
		    	<td><a href="productList.htm?page=home&id=${categoryId}&paging=${num}"><c:out value="${num}"/></a></td>
            </c:forEach>
	      	<td><a href="javascript:paging('dataTable','productList.htm?page=home&id=${categoryId}&paging=','${currentPage+1}','${maxPageSize}')">Next</a></td>
		 </tr>		
	</table>
</body>
</html>