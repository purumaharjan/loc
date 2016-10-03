function get(tableID,url){
	var arrays=new Array();
	var q=0;
	var table = document.getElementById(tableID), 

	rows = table.getElementsByTagName('tr'),i, j, cells;

	for (i = 0, j = rows.length; i < j; ++i) {
		var row = table.rows[i];
		var chkbox = row.cells[0].childNodes[0];
		cells = rows[i].getElementsByTagName('td');
		if (!cells.length) {
			continue;
		}
		if(null != chkbox && true == chkbox.checked) {
			arrays[q]=cells[1].innerHTML;
			q++;
		}
	}
	var arr="";
	for(var t=0;t<arrays.length;t++){
		if(t==0)	
			arr=arr+arrays[t];
		else
			arr=arr+","+arrays[t];
	}
  
	location.replace(url+arr);

}

