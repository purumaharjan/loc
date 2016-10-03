function confirmDeleteList(tableID,url){
  if (confirm("Are you sure you want to delete those List")){
	get(tableID,url);
	}
}
function confirmDelete(delUrl) {
  if (confirm("Are you sure you want to delete")) {
    document.location = delUrl;
  }
}
