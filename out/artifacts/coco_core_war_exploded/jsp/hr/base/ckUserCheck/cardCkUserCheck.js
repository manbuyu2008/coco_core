var ckType;
var ckType;
var userList;
page = $.extend(page, {
    _init: function () {
        $('#form').form('load', pageParam.jsonObject);
        userList = coco.plugin.list.userList({
            listId: "userId",
            required: true,
            canEmpty: false
        });
        ckType = coco.plugin.combo.ckType({
            comboId: "checkType",
            canEmpty: false,
            required: true,
            value: $("#checkType").val()
        });
        $('#checkDate').datebox({
            required: true
        });
        $('#checkTime').timespinner({
            required: true,
            showSeconds: true
        });
    },
    //从json对象给页面输入框赋值
    loadData: function (data) {
        $("#id").val(data["id"]);
        $("#userId").val(data["userId"]);
        $("#checkDate").val(data["checkDate"]);
        $("#checkTime").val(data["checkTime"]);
        $("#checkType").val(data["checkType"]);
        $("#version").val(data["version"]);
    }
});
