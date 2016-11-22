var deptTree;
var adminDept;
var sexCombo;
var statusCombo;
page = $.extend(page, {
    _init: function () {
        $('#form').form('load',pageParam.jsonObject);
        sexCombo = coco.plugin.combo.comboSex({
            comboId:"sex",
            canEmpty:false,
            required:true,
            value:$("#sex").val()
        });
        statusCombo = coco.plugin.combo.comboStatus({
            comboId:"status",
            canEmpty:false,
            required:true,
            onChange:function(value){
               if(value==1){
                   $(".tr_stopInfo").hide();
                   $("#stopInfo").val("");
                   $("#stopTime").val("");
               }else{
                   $(".tr_stopInfo").show();
                   $("#stopTime").datebox('setValue',window.$$date.getNowDateStr());
               }
            },
            value:$("#status").val()
        });
        if(statusCombo.getValue()==1){
            $(".tr_stopInfo").hide();
            $("#stopInfo").val("");
            $("#stopTime").val("");
        }else{
            $(".tr_stopInfo").show();
        }
        deptTree = coco.plugin.tree.deptTree({
            treeId:"dept",
            canEmpty:false,
            panelWidth:400,
            isOnlySelectLeaf:true,
            hasDefRoot:false,
            required:true,
            onChange:function(value){
                if(adminDept){
                    adminDept.setValue(value);
                }
            }
        });
        adminDept = coco.plugin.tree.deptTree({
            treeId:"adminDept",
            canEmpty:false,
            panelWidth:400,
            isOnlySelectLeaf:false,
            hasDefRoot:false,
            multiple:true,
            required:true
        });
        if($("#id").val()==""){
            $("#pwdDef").hide();
        }else{
            $("#pwdDef").show();
        }
    },
    pwdDef:function(){
        $$msg.confirm("确实要初始化该记录密码吗？", function (isOk) {
            if (!isOk) return;
        coco.utils.ajaxPostData("./custom?actionType=pwdDef", {userId:$("#id").val()},
            function (data) {
                if (data) {
                    coco.utils.msg.alert("密码初始化成功");
                } else {
                    coco.utils.msg.slideError("密码初始化失败");
                }
            });
        });
    } ,
    //从json对象给页面输入框赋值
    loadData:function (data) {
        $("#id").val(data["id"]);
        $("#code").val(data["code"]);
        $("#name").val(data["name"]);
        $("#dept").val(data["dept"]);
        $("#adminDept").val(data["adminDept"]);
        $("#birthdate").val(data["birthdate"]);
        $("#postName").val(data["postName"]);
        $("#officeTel").val(data["officeTel"]);
        $("#homeTel").val(data["homeTel"]);
        $("#mobile").val(data["mobile"]);
        $("#email").val(data["email"]);
        $("#desc").val(data["desc"]);
        $("#status").val(data["status"]);
        $("#stopInfo").val(data["stopInfo"]);
        $("#stopTime").val(data["stopTime"]);
        $("#sex").val(data["sex"]);
        $("#privType").val(data["privType"]);
        $("#version").val(data["version"]);
    }
});
