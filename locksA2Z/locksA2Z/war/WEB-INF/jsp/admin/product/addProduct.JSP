<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<META http-equiv="content-type" content="text/html; charset=UTF-8" />


<script type="text/javascript">
function validate()
{
	 var image =document.getElementById("image").value;
	 if(image!=''){
		  var checkimg = image.toLowerCase();
		  if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)){
			  alert("Please enter  Image  File Extensions .jpg,.png,.jpeg");
			  document.getElementById("image").focus();
			  return false;
		    }
		 }
	 return true;
}
</script>
</head>

<body>

	<div>
		<form:form action="addProductSubmit.htm" method="POST"
			onsubmit="return validate();" commandName="product"
			enctype="multipart/form-data">
			<c:if test="${not empty product.name}">
				<form:hidden path="id" />
				<c:if test="${not empty product.productImage}">
					<img src="../resources/images/${product.productImage}"></img>
					<form:hidden path="productImage" />
					<a href="deleteProductImage.htm?productId=${product.id}">Delete
						image</a>
				</c:if>
			</c:if>
			<br />
			<br />
			<div class="username">
				<div class="labelTxtBox">
					<label>Choose Category:</label>
				</div>
				<select name="categoryName" class="textbox">
					<c:if test="${empty productCategory}">
						<option>Select category</option>
					</c:if>
					<c:if test="${not empty productCategory}">
						<option>${productCategory.name}</option>
					</c:if>
					<c:forEach var="leafCategories" items="${leafCategories}">
						<option>${leafCategories.name}</option>
					</c:forEach>
				</select>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Product Name:</label>
				</div>
				<div class="textbox">
					<form:input id="productName" path="name" />
				</div>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label> Product BackSets:</label>
				</div>
				<div class="textbox">
					<form:input id="productBackSets" path="productBackSets" />
				</div>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Product BarCodeId:</label>
				</div>
				<div class="textbox">
					<form:input id="productBarCodeId" path="productBarCodeId" />
				</div>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Product Description:</label>
				</div>
				<div class="textbox">
					<form:input id="productDescription" path="productDescription" />
				</div>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Product FinishColor:</label>
				</div>
				<div class="textbox">
					<form:input id="productFinishColor" path="productFinishColor" />
				</div>
			</div>

			<div class="username">
				<div class="labelTxtBox">
					<label>Product Grade:</label>
				</div>
				<div class="textbox">
					<form:input id="productGrade" path="productGrade" />
				</div>
			</div>
			<c:if test="${empty product.productImage}">
				<div class="username">
					<div class="labelTxtBox">

						<form:label for="fileData" path="fileData">File:</form:label>
					</div>

					<form:input class="textbox" path="fileData" id="image" type="file"
						name="image" />
			</c:if>
	</div>
	<div class="username">
		<div class="labelTxtBox">
			<label>Product KeyTypes:</label>
		</div>
		<div class="textbox">
			<form:input id="productKeyTypes" path="productKeyTypes" />
		</div>
	</div>


	<div class="username">
		<div class="labelTxtBox">
			<label>product LeverDesign:</label>
		</div>
		<div class="textbox">
			<form:input id="productLeverDesign" path="productLeverDesign" />
		</div>
	</div>


	<div class="username">
		<div class="labelTxtBox">
			<label>product Price:</label>
		</div>
		<div class="textbox">
			<form:input id="productPrice" path="productPrice" />
		</div>
	</div>

	<div class="username">
		<div class="labelTxtBox">
			<label>product Quantity:</label>
		</div>
		<div class="textbox">
			<form:input id="productQuantity" path="productQuantity" />
		</div>
	</div>

	<div class="username">
		<div class="labelTxtBox">
			<label>product Type:</label>
		</div>
		<div class="textbox">
			<form:input id="productType" path="productType" />
		</div>
	</div>

	<div class="submit">
		<input id="addCategoryBtn" type="submit" value="" />
	</div>

	</form:form>
	</div>
</body>
</html>