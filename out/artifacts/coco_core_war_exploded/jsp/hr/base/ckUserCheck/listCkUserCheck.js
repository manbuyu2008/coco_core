$(function () {
    init();
    window.checkValid = page.checkValid;
});

function init() {
    page._init();
    page.initGrid();
    if($("#isManager").val()!=1){
        $("#user_tr").hide();
    }
    if(isStart&&document.getElementById("inWork")!=undefined){
      $('#inWork').linkbutton('disable');
    }
    if(!isStart&&document.getElementById("outWork")!=undefined){
        $('#outWork').linkbutton('disable');
    }
    sys_loaded();
}
var ckType;
var userList;
var checkDate;
var page = {
    idField: "id",
    _init: function () {
        $('#queryForm').form('load', pageParam.queryParams);
        ckType = coco.plugin.combo.ckType({
            comboId: "checkType",
            canEmpty: true
        });
        userList = coco.plugin.list.userList({
            listId: "userId",
            canEmpty: true
        });
        checkDate = coco.ctrl.dateQuery({
            valueTagId: "checkDate"
        });
    },
    initGrid: function () {
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        var dataParams = { data: queryParams };
        var privilegeValue = pageParam.privilegeValue.trim();
        var hasEdit = privilegeValue.indexOfIgnoreCase(",edit,") > -1;
        var hasDel = privilegeValue.indexOfIgnoreCase(",del,") > -1;
        $('#tbList').datagrid({
            title: "打卡管理列表",
            idField: page.idField,
            nowrap: false,
            fit: true,
            fitColumns: true,
            striped: true,
            url: 'data',
            singleSelect: true,
            pageList: [20, 50, 100],
            pageSize: pageParam.pageSize,
            pageNumber: pageParam.pageNumber,
            queryParams: dataParams,
            frozenColumns: [
                [
                    {field: page.idField, title: "操作", width: 100, align: 'center',
                        formatter: page.handleFormatter, opt: true, hidden: hasEdit || hasDel ? false : true},
                    {title: '打卡人', field: 'userName', width: 120, align: 'center', sortable: true}
                ]
            ],
            columns: [
                [
                    {title: '打卡日期', field: 'checkDate', width: 120, align: 'center', sortable: true},
                    {title: '打卡时间', field: 'checkTime', width: 120, align: 'center', sortable: true},
                    {title: '打卡类型', field: 'checkTypeName', width: 120, align: 'center', sortable: true}
                ]
            ],
            rowStyler: function (index, row) {
                if (row.status == 0) {
                    return 'background-color:#fff;color:#a0a0a0;';
                }
            },
            pagination: true,
            rownumbers: true
        });
    },
    //操作列
    handleFormatter: function (value, rowData, rowIndex) {
        var privilegeValue = pageParam.privilegeValue.trim();
        var hasEdit = privilegeValue.indexOfIgnoreCase(",edit,") > -1;
        var hasDel = privilegeValue.indexOfIgnoreCase(",del,") > -1;
        var s = "";
        if (hasEdit) s += "<a href='###' class='coco_opt' onclick=page.edit('" + value + "')>[详细]</a>&nbsp;";
        if (hasDel) s += "<a href='###' class='coco_opt' onclick=page.del('" + value + "')>[删除]</a>";
        return s;
    },
    inWork: function (data) {
        $$msg.showWait("正在处理，请稍候...");
        var param = {
            checkType: "1"
        };
        $.post("work", param, function (data) {
            if (data.state) {
                $$msg.slideMsg("上班打卡成功！");
                page.query();
                    $('#inWork').linkbutton('disable');
                    $('#outWork').linkbutton('enable');
                $$msg.closeWait();
            }
            else {
                $$msg.slideError(data.msg);
            }
            if (fn) fn(data.state);
            $$msg.closeWait();
        }, "json");

    },
    outWork: function (data) {
        $$msg.showWait("正在处理，请稍候...");
        var param = {
            checkType: "2"
        };
        $.post("work", param, function (data) {
            if (data.state) {
                $$msg.slideMsg("下班打卡成功！");
                page.query();
                $$msg.closeWait();
            }
            else {
                $$msg.slideError(data.msg);
            }
            if (fn) fn(data.state);
            $$msg.closeWait();
        }, "json");

    },
    //查询/刷新
    query: function () {
        if (!coco.page.model.checkValid("queryForm")) return;
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        coco.eui.grid.setGridPageNumber("tbList", 1);
        $("#tbList").datagrid("reload", {query: true, data: queryParams });
    },
    //新增
    card: function () {
        var pager = $('#tbList').datagrid('getPager');
        var pagination = $('#tbList').datagrid('options').pagination;
        var pageSize = 0;
        var pageNumber = 0;
        if (pager && pagination) {
            pageSize = pager.pagination("options").pageSize;
            pageNumber = pager.pagination("options").pageNumber;
        }
        var data = $$json.stringify({pageSize: "" + pageSize, pageNumber: "" + pageNumber, queryParams: coco.page.model.getCardDataStr("queryForm")});
        coco.page.model.card("", data);
    },
    //编辑
    edit: function (id) {
        var pager = $('#tbList').datagrid('getPager');
        var pagination = $('#tbList').datagrid('options').pagination;
        var pageSize = 0;
        var pageNumber = 0;
        if (pager && pagination) {
            pageSize = pager.pagination("options").pageSize;
            pageNumber = pager.pagination("options").pageNumber;
        }
        var data = $$json.stringify({pageSize: "" + pageSize, pageNumber: "" + pageNumber, queryParams: coco.page.model.getCardDataStr("queryForm")});
        coco.page.model.card(id, data);
    },
    //删除
    del: function (id) {
        coco.page.model.del(id, function (success) {
            if (success) {
                $("#tbList").datagrid("reload");
            }
        });
    },
    exportExcel: function () {
        coco.utils.exportExcelExA("tbList", pageParam.filterStr, pageParam.title);
    },
    //查询时的条件验证；
    checkValid: function () {
        return true;
    }
};

