
//分页
function dividePage(allPages, currentPage, flag) {
	if (flag == "next") {
		if (allPages != currentPage) {
			var src = "/superad/allUsers/" + allPages + "/"
					+ currentPage + "/" + flag;
			var userName = $("#userName-search-input").val();
			
			if (userName == null || userName == "") {
				userName = 1;
			}

			src = src + "/" + userName+".do";
			parent.changeIframe(src);
		} else {
			alert("已到达最后一页");
		}
	} else {
		var src = "/superad/allUsers/" + allPages + "/"
				+ currentPage + "/" + flag;
		var userName = $("#userName-search-input").val();
		
		if (userName == null || userName == "") {
			userName = 1;
		}

		src = src + "/" + userName + ".do";
		parent.changeIframe(src);
	}
}

/**
 * 根据用户名进行查询
 */
function searchByuserName(){
	var userName = $("#userName-search-input").val();
	
	if (userName == null || userName == "") {
		userName = 1;
	}


	var src = "/superad/allUsers/0/1/previous";
	src = src + "/" + userName + ".do";
	parent.changeIframe(src);
}

//设计删除确认弹窗
function deleteUser(){
    var msg = "删除操作无法恢复，您确定要删除该用户吗？";
    if (confirm(msg)==true)
        return true;
    else
        return false;
}