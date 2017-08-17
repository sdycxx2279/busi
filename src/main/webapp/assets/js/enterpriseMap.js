
//分页
function dividePage(allPages, currentPage, flag) {

    if (flag == "next") {
        if (allPages != currentPage) {
            var src = "/user/allEnterprises/" + allPages + "/"
                + currentPage + "/" + flag;

            src = src + getProperties();
            parent.changeIframe(src);
        } else {
            alert("已到达最后一页");
        }
    } else {
        var src = "/user/allEnterprises/" + allPages + "/"
            + currentPage + "/" + flag;

        src = src + getProperties();
        parent.changeIframe(src);
    }

}

/**
 * 根据企业属性进行查询
 */
function searchByProperties() {

    var src = "/user/allEnterprises/0/1/previous";
    src = src + getProperties();
    parent.changeIframe(src);
}

function getProperties() {
    var name = $("#name-search-input").val();
    var leader = $("#leader-search-input").val();
    var member = $("#member-search-input").val();
    var level = $("#level-search-input").val();
    var deadline = $("#deadline-search-input").val();
    var tag = $("#tag-search-input").val();

    if (name === null || name == "") {
        name = 1;
    }
    if (leader === null || leader == "") {
        leader = 1;
    }
    if (member === null || member == "") {
        member = 1;
    }
    if (level === null) {
        level = 0;
    }
    if (deadline === null || deadline == "") {
        deadline = 1;
    }
    if (tag === null || tag == 0) {
        tag = -1;
    }

    var src = "/" + name + "/" + leader + "/" + member + "/" + level + "/" + deadline + "/" + tag + ".do"

    return src;
}

function full(){
    if(document.getElementById("list").style.display=="block"){
        document.getElementById("list").style.display="none";
        document.getElementById("allmap").style.height="90%";
        document.getElementById('fullScreen').value="取消全屏";
    }else{
        document.getElementById("list").style.display="block";
        document.getElementById("allmap").style.height="600px";
        document.getElementById('fullScreen').value="地图全屏";
    }
}