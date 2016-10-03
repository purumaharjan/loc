<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<h2>Add Admins</h2>
<style type="text/css">
.label {
	font-size: 14px;
	font-color: #ff2233;
	font-family: sans-serif;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 10px;
}

.error {
	font-size: 14px;
	font-color: #ff0000;
	font-family: sans-serif;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<form:form method="POST" action="formTask.htm" commandName="user">
		<form:hidden path="id" />
		
		<div class="username">
			<form:errors path="name" cssClass="error" />
		
		<div class="labelTxtBox">
			<label>Name:</label>
			</div>
			<div class="textbox">
			<form:input path="name" />
			</div>
		</div>
		<div class="username">
			<form:errors path="username" cssClass="error" />
			<div class="labelTxtBox">
		
		
			<label>Username: </label></div>
			<div class="textbox">
			<form:input path="username" />
			</div>
		</div>
		<div class="username">
			<form:errors path="password" cssClass="error" />
		<div class="labelTxtBox">
		
			<label >Password:</label></div>
			<div class="textbox">
			<form:input type="password" path="password" />
			</div>
		</div>
		<div class="username">
			<form:errors path="confirmPassword" cssClass="error" />
		<div class="labelTxtBox">
		
			<label>Confirm Password:</label></div>
			<div class="textbox">
			<form:input type="password" path="confirmPassword" />
			</div>
		</div>
		<div class="submit">
			<input type="submit" value="" />
		</div>
	</form:form>
</body>
</html>
