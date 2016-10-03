<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="../resources/js/jquery.js" type="text/javascript"></script>
<script src="../resources/js/jquery-ui.custom.js" type="text/javascript"></script>
<script src="../resources/js/jquery.cookie.js" type="text/javascript"></script>

<link href="../resources/skin/ui.dynatree.css" rel="stylesheet"
	type="text/css">
<link type="text/css" rel="stylesheet" href="resources/style/admin.css" />
<script src="../resources/js/jquery.dynatree.js" type="text/javascript"></script>

<script type="text/javascript">
var selections="";
$(function(){
    // Attach the dynatree widget to an existing <div id="tree"> element
    // and pass the tree options as an argument to the dynatree() function:
  $("#tree").dynatree({
    	  checkbox: true,
	      classNames: {checkbox: "dynatree-checkbox"},
   		  selectMode: 3,
   		  initAjax: {url: "ajaxTree.htm", data:{"id":document.roleForm.selectedId.value}},
   		onPostInit: function(isReloading, isError) {
				var selKeys=$.map(this.getSelectedNodes(),function(node){
					return node.data.key;
					});
				
				var parentKeys=$.map(this.getSelectedNodes(),function(node){
					return node.parent.data.key;
				});
				
				var selectedArr=[];
				for(i=0;i<parentKeys.length;i++){
					if($.inArray(parentKeys[i],selectedArr)==-1 && parentKeys[i]!="_1"){
						selectedArr.push(parentKeys[i]);
					}
				}
				var finalArr=[];
				for(k=0;k<selKeys.length;k++){
					if($.inArray(selKeys[k],finalArr)==-1){
						finalArr.push(selKeys[k]);
					}
				}
				for(l=0;l<selectedArr.length;l++){
					if($.inArray(selectedArr[l],finalArr)==-1){
						finalArr.push(selectedArr[l]);
					}
				}
				
				selections=finalArr.join(",");
				
			},
   		  onSelect:function(select,node){
				var selKeys=$.map(node.tree.getSelectedNodes(),function(node){
					return node.data.key;
					});
				
				var parentKeys=$.map(node.tree.getSelectedNodes(),function(node){
					return node.parent.data.key;
				});
					
				var selectedArr=[];
				for(i=0;i<parentKeys.length;i++){
					if($.inArray(parentKeys[i],selectedArr)==-1 && parentKeys[i]!="_1"){
						selectedArr.push(parentKeys[i]);
					}
				}
				var finalArr=[];
				for(k=0;k<selKeys.length;k++){
					if($.inArray(selKeys[k],finalArr)==-1){
						finalArr.push(selKeys[k]);
					}
				}
				for(l=0;l<selectedArr.length;l++){
					if($.inArray(selectedArr[l],finalArr)==-1){
						finalArr.push(selectedArr[l]);
					}
				}
				
				selections=finalArr.join(",");
   	   		  }
		
    	});
	});
    
function CheckAll(chk,isCheck)
{
	if(isCheck){
	for (i = 0; i < chk.length; i++)
		chk[i].checked = true ;
	}else{

	for (i = 0; i < chk.length; i++)
		chk[i].checked = false ;
	}
}
var str="";
function getAllCheck(chk){
	
	var flag=true;
	for(i=0;i<chk.length;i++){
		if(chk[i].checked){
			if(flag){
				str=str+chk[i].value;
				flag=false;
			}
			else{
				str=str +","+ chk[i].value ;
			}
		}		
	}
}

function addToList(list1,list2){
	list1.value=selections;
	list2.value=str;
}
</script>
</head>
<body>
<h2>Add new Role</h2>
<c:set var="flag" value="" />
<form:form name="roleForm" method="POST" action="addRole.htm"
	commandName="role">
	<div align="center"><form:hidden path="id" />
		<input type="hidden" name="permissionList" value="${permissionList}" />
		<input type="hidden" name="userList" />
	
		<div style="width: 100%;">
			<div class="error"><form:errors path="name" /></div>
			<div class="labelTxtBox"><label>Role:</label></div>
			<div class="textbox input" style="float: left;"><form:input path="name" /></div>
			<div class="submit"><input type="submit" value=""
			onclick="getAllCheck(document.roleForm.selected);addToList(document.roleForm.permissionList,document.roleForm.userList);document.roleForm.submit();" />
		</div>
		</div>
		<input type="hidden" name="selectedId" value="${selectedId}" />

		<div class="selections">
			<div class="subselections">
				<div class="error"><form:errors path="permissions" /></div>
				<div align="left"><label>Select Permissions</label></div>
				<div id="tree" align="left" class="tree"></div>
			</div>

			<div class="subselections">
				<div align="left"><label>Select users</label></div>
				<div class="userTable">
					<table border="0" cellpadding="3" cellspacing="1" bgcolor="#E2E3E4" width="200px">
						<tr>
							<th>
								<div align="left"><input type="checkbox" name="checkAllPtr"
								onclick="CheckAll(document.roleForm.selected,document.roleForm.checkAllPtr.checked)" /></div>
							</th>
							<th align="left">User</th>
						</tr>
						<c:forEach var="user" items="${users}">
						<tr>
							<td><c:forEach var="assignedUser" items="${role.users}">
								<c:if test="${assignedUser.id==user.id}">
								<c:set var="flag" value="checked='checked'" />
								</c:if>
						</c:forEach> <input type="checkbox" align="middle" name="selected"
							value="${user.id}" <c:out value="${flag}"/> /></td>

							<td align="left">${user.name}</td>
						</tr>
						<c:set var="flag" value="" />
					</c:forEach>
					</table>
				</div>
				</div>
			</div>
			
	</div>
</form:form>

</body>
</html>