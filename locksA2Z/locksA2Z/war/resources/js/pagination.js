function paging(tableID,url,currentPage,maxPageSize){
	if(currentPage<1){
		location.replace(url+1);
	}
	else if(currentPage>maxPageSize){
		location.replace(url+maxPageSize);
	}
	else{
		location.replace(url+currentPage);
	}
}

