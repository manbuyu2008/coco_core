$(function () {
    init();
    window.checkValid = page.checkValid;
});

function init() {
    page._init();
    page.initGrid();
    sys_loaded();
}
var deptTree;
var statusCombo;
var page = {
    idField: "id",
    _init: function () {
        $('#queryForm').form('load', pageParam.queryParams);
        statusCombo = coco.plugin.combo.comboStatus({
            comboId:"status",
            canEmpty:true,
            value:$("#status").val()
        });
    },
    initGrid: function () {
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        var dataParams = { data: queryParams };
        $('#tbList').datagrid({
            title: "操作按钮列表",
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
                    {field: page.idField, title: "操作", width: 100, align: 'center', formatter: page.handleFormatter},
                    {title: '编码', field: 'code', width: 120, align: 'center', sortable: true},
                    {title: '按钮名称', field: 'name', width: 120, align: 'center', sortable: true}
                ]
            ],
            columns: [
                [
                    {title: '按钮图标', field: 'btnIcon', width: 120, align: 'center', sortable: true},
                    {title: '按钮调用方法', field: 'methodName', width: 120, align: 'center', sortable: true},
                    {title: '状态', field: 'status', width: 120, align: 'center', sortable: true, formatter: page.statusFormatter}
                ]
            ],
            rowStyler: function(index,row){
                if (row.status==0){
                    return 'background-color:#fff;color:#a0a0a0;';
                }
            },
            pagination: true,
            rownumbers: true
        });
    },
    //操作列
    handleFormatter: function (value, rowData, rowIndex) {
//    pageParam.permission.card && !pageParam.permission.del
        if (!1 == 1) return "<span style='color: gray;'>无权限</span>";
        var s = "";
//        pageParam.permission.card     pageParam.permission.del
        if (1 == 1) s += "<a href='###' class='coco_opt' onclick=page.edit('" + value + "')>[详细]</a>&nbsp;";
        if (1 == 1) s += "<a href='###' class='coco_opt' onclick=page.del('" + value + "')>[删除]</a>";
        return s;
    },
    statusFormatter: function (value, rowData, rowIndex) {
        if (value == 1) return "启用";
        else   return "停用";
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
            if (success){
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
function getSelected() {
    var selected = $('#test').datagrid('getSelected');
    if (selected) {
        alert(selected.code + ":" + selected.name + ":" + selected.addr + ":" + selected.col4);
    }
}
function getSelections() {
    var ids = [];
    var rows = $('#test').datagrid('getSelections');
    for (var i = 0; i < rows.length; i++) {
        ids.push(rows[i].code);
    }
    alert(ids.join(':'));
}
