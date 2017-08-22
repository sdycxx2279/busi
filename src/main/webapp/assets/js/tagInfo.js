//分页
function dividePage(allPages, currentPage, flag) {
    if (flag == "next") {
        if (allPages != currentPage) {
            var src = "/ad/allTags/" + allPages + "/"
                + currentPage + "/" + flag+".do";

            src = src + "/" + userName+".do";
            parent.changeIframe(src);
        } else {
            alert("已到达最后一页");
        }
    } else {
        var src = "/ad/allTags/" + allPages + "/"
            + currentPage + "/" + flag+".do";

        parent.changeIframe(src);
    }
}

/**
 * 对输入进行校验
 */
function addTag(){
    var name = $("#name").val();

    if (name == null || name == "") {
       alert("类别名不可为空！");
       return false;
    }
    if(name.indexOf(" ") != -1){
        alert("类别名不可包含空格！");
        return false;
    }
}

function deleteTag(){
    var msg = "删除将导致所有该类别企业类别变为无，且操作无法恢复，您确定要删除吗？";
    if (confirm(msg)==true)
        return true;
    else
        return false;
}

//弹出输入框修改类别名称
function editTag(id,tagName){
    var prom = "您希望将"+tagName+"修改为：";
    var name=prompt(prom);
    if (name == null || name == "") {
        return false;
    }
    if(name.indexOf(" ") != -1){
        alert("类别名不可包含空格！");
        return false;
    }

    var src = "/ad/editTag/"+id+"/"+name+".do";
    parent.changeIframe(src);
}