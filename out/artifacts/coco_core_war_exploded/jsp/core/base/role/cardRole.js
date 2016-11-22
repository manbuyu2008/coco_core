var statusCombo;
page = $.extend(page, {
    _init: function () {
        $('#form').form('load',pageParam.jsonObject);
        $("#dataPriv").combobox("loadData", pageParam.dataPriv.data);
        statusCombo = coco.plugin.combo.comboStatus({
            comboId:"status",
            canEmpty:false,
            required:true,
            value:$("#status").val()
        });
    },
    //从json对象给页面输入框赋值
    loadData:function (data) {
        $("#id").val(data["id"]);
        $("#code").val(data["code"]);
        $("#name").val(data["name"]);
        $("#priv").val(data["priv"]);
        $("#dataPriv").val(data["dataPriv"]);
        $("#note").val(data["note"]);
        $("#version").val(data["version"]);
    }
});
