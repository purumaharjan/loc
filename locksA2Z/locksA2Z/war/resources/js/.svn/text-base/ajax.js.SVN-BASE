var flags=new Array();

function loadSubcategory(subid) {

if(isAlreadyLoaded(subid)) {
	return;
}

	$.post("displaySubCategory.htm",{categoryId:subid},callback);

		function callback(data) {
			if(data=="") {
				flags[subid]=true;
				return;
			}
			var arr=data.split(",");
			for(var x = 0;x<arr.length;x++)
				$("#"+subid).append("<option value=''>"+arr[x]+"</option>");
			flags[subid]=true;
		}

		
function isAlreadyLoaded() {
	if(flags[subid]==true) {
		return true;
	}
	else {
		return false;
	}
}
}

