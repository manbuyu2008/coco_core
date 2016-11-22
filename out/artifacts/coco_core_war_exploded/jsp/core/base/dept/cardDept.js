var deptTree;
var statusCombo;
page = $.extend(page, {
    _init: function () {
        $('#form').form('load',pageParam.jsonObject);
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
            treeId:"parentId",
            canEmpty:true,
            panelWidth:400,
            isOnlySelectLeaf:false,
            hasDefRoot:false,
            required:false
        });
    },
    //从json对象给页面输入框赋值
    loadData:function (data) {
        $("#id").val(data["id"]);
        $("#code").val(data["code"]);
        $("#name").val(data["name"]);
        $("#levelCode").val(data["levelCode"]);
        $("#levelNum").val(data["levelNum"]);
        $("#parentId").val(data["parentId"]);
        $("#deptType").val(data["deptType"]);
        $("#note").val(data["note"]);
        $("#status").val(data["status"]);
        $("#stopInfo").val(data["stopInfo"]);
        $("#stopTime").val(data["stopTime"]);
        $("#version").val(data["version"]);
    }
});
