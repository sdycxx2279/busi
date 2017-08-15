
document.getElementById("level")[level].selected=true;

if(message==1){
    alert("系统错误，请稍后再试！");
}
//初始化ueditor编辑器
var ue1 = UE.getEditor('description');
var ue2 = UE.getEditor('question1');
var ue3 = UE.getEditor('question2');
var ue4 = UE.getEditor('question3');
var ue5 = UE.getEditor('question4');
var ue6 = UE.getEditor('question5');

//为富文本编辑框赋值
ue1.ready(function() {
    ue1.setContent(description);
});
ue2.ready(function() {
    ue2.setContent(question1);
});
ue3.ready(function() {
    ue3.setContent(question2);
});
ue4.ready(function() {
    ue4.setContent(question3);
});
ue5.ready(function() {
    ue5.setContent(question4);
});
ue6.ready(function() {
    ue6.setContent(question5);
});

// 百度地图API功能
var map = new BMap.Map("l-map");    // 创建Map实例
map.centerAndZoom(new BMap.Point(lng, lat), 15);  // 初始化地图,设置中心点坐标和地图级别
var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
map.addControl(top_left_control);
map.addControl(top_left_navigation);
map.addControl(top_right_navigation);
map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

var overlays = [];

var point = new BMap.Point(lng,lat);
var marker = new BMap.Marker(point);
map.addOverlay(marker);
marker.enableDragging();
overlays.push(marker);

map.addEventListener("click",function(e){
    var point = new BMap.Point(e.point.lng,e.point.lat);
    var marker = new BMap.Marker(point);// 创建标注
    map.addOverlay(marker);
    marker.enableDragging();
    overlays.push(marker);
});
function G(id) {
    return document.getElementById(id);
}



var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "suggestId"
        ,"location" : map
    });

ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
    var str = "";
    var _value = e.fromitem.value;
    var value = "";
    if (e.fromitem.index > -1) {
        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }
    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

    value = "";
    if (e.toitem.index > -1) {
        _value = e.toitem.value;
        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }
    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    G("searchResultPanel").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
    var _value = e.item.value;
    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

    setPlace();
});

function setPlace(){
    map.clearOverlays();    //清除地图上所有覆盖物
    function myFun(){
        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
        map.centerAndZoom(pp, 18);
        marker = new BMap.Marker(pp)
        map.addOverlay(marker);//添加标注
        marker.enableDragging();
        overlays.push(marker);
    }
    var local = new BMap.LocalSearch(map, { //智能搜索
        onSearchComplete: myFun
    });
    local.search(myValue);
}
function clearAll() {
    for(var i = 0; i < overlays.length; i++){
        map.removeOverlay(overlays[i]);
    }
    overlays.length = 0
}
//校验输入格式并为隐藏输入框赋值
function send(){
    var name = $("#name").val();
    var level = $("#level").val();
    var type = $("#type").val();
    var boss = $("#boss").val();
    var photo_boss = $("#photo_boss").val();
    var call_boss = $("#call_boss").val();
    var leader = $("#leader").val();
    var photo_leader = $("#photo_leader").val();
    var call_leader = $("#call_leader").val();
    var member = $("#member").val();
    var photo_member = $("#photo_member").val();
    var call_member = $("#call_member").val();
    var deadline = $("#deadline").val();
    var description = ue1.getContent();

    //用于校验是否为纯数字
    var reg=/^[1-9]\d*$|^0$/;

    if(name==null||name==""){
        alert("企业名不可为空！");
        return false;
    }
    if(reg.test(name)==true){
        alert("企业名不可为纯数字");
        return false;
    }
    if(overlays.length!=1){
        alert("地点必选且仅可以选择一个！");
        return false;
    }
    $("#lng").val(overlays[0].getPosition().lng);
    $("#lat").val(overlays[0].getPosition().lat);
    if(level==null||level=="0"){
        alert("必须选择级别！");
        return false;
    }
    if(boss==null||boss==""){
        alert("企业负责人姓名不可为空！");
        return false;
    }
    if(reg.test(boss)==true){
        alert("企业负责人姓名不可为纯数字");
        return false;
    }
    if(!(photo_boss==null||photo_boss=="") && !isImage(photo_boss)){
        alert("照片仅接受jpg、jpeg、bmp、png、gif五种格式！");
        return false;
    }
    if(call_boss==null||call_boss==""){
        alert("企业负责人电话不可为空！");
        return false;
    }
    if(leader==null||leader==""){
        alert("网格长姓名不可为空！");
        return false;
    }
    if(reg.test(leader)==true){
        alert("网格长姓名不可为纯数字");
        return false;
    }
    if(!(photo_leader==null||photo_leader=="")&& !isImage(photo_leader)){
        alert("照片仅接受jpg、jpeg、bmp、png、gif五种格式！");
        return false;
    }
    if(call_leader==null||call_leader==""){
        alert("网格长电话不可为空！");
        return false;
    }
    if(member==null||member==""){
        alert("网格员姓名不可为空！");
        return false;
    }
    if(reg.test(member)==true){
        alert("网格员姓名不可为纯数字");
        return false;
    }
    if(!(photo_member==null||photo_member=="") && !isImage(photo_member)){
        alert("照片仅接受jpg、jpeg、bmp、png、gif五种格式！");
        return false;
    }
    if(call_member==null||call_member==""){
        alert("网格员电话不可为空！");
        return false;
    }
    if(deadline==null||deadline==""){
        alert("截止日期不可为空！");
        return false;
    }
    if(description==null||description==""){
        alert("企业简介不可为空！");
        return false;
    }

    $("#input_description").val(ue1.getContent());
    $("#input_question1").val(ue2.getContent());
    $("#input_question2").val(ue3.getContent());
    $("#input_question3").val(ue4.getContent());
    $("#input_question4").val(ue5.getContent());
    $("#input_question5").val(ue6.getContent());
}

//校验文件是否为图片
function isImage(file){
    photoExt=file.substr(file.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    if(photoExt!='.bmp'&&photoExt!='.jpg'&&photoExt!='.jpeg'&&photoExt!='.gif'&&photoExt!='.png')
        return false;
    else
        return true;
}

function goBack(){
    self.location = document.referrer;
}