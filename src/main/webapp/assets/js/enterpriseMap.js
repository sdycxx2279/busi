
/**
 * 根据企业属性进行查询
 */
function searchByProperties() {
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

    var src = "/user/allEnterprises";
    src = src + "/" + name + "/" + leader + "/" + member + "/" + level + "/" + deadline + "/" + tag + ".do"
    parent.changeIframe(src);
}

function getProperties() {


    return src;
}