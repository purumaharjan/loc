function CheckAll(chk)
{

	if(document.listForm.checkAllPtr.checked==true){
		
						if(!chk.length)			chk.checked=true;
							
					else{
							for (i = 0; i < chk.length; i++){
								chk[i].checked = true ;
								}
							}	
							
						
				}
	
	
	
	else{				
				if(!chk.length) chk.checked=false; 
			else{			
				for (i = 0; i < chk.length; i++)
					chk[i].checked = false ;
				}
		}
	
}
var str="";
function getAllCheck(chk){
	
	var flag=true;
			if(!chk.length) 
			
					{if(chk.checked){
								if(flag){
									str=str+chk.value;
									flag=false;
								}
								else{
									str=str +","+ chk.value ;
								}
							}
							}
		else{
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
}
function addToList(list) {
	if(str!=""){
		list.value = str;
		return true;
	}
	else{
		alert("Please Select an item.");
		return false;
		}
}