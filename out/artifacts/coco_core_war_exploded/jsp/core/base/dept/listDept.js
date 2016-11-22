$(function () {
    init();
    window.checkValid = page.checkValid;
});

function init() {
    var privilegeValue = pageParam.privilegeValue.trim();
    var hasEdit = privilegeValue.indexOfIgnoreCase(",edit,") > -1;
    var hasDel = privilegeValue.indexOfIgnoreCase(",del,") > -1;
    var hasRight = hasEdit || hasDel ;
    var ckWidth = (hasEdit?45:0)+(hasDel?45:0);
    page._init();
    page.initTree();
    page.initGrid(hasRight,ckWidth);
    collapse();
    sys_loaded();
}
function collapse() {
    $("#layout").layout("collapse", "west");
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
    initGrid: function (hasRight,ckWidth) {
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        var dataParams = { data: queryParams };
        $('#tbList').datagrid({
            title: "部门列表",
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
                    {field: page.idField, title: "操作", width: ckWidth, align: 'center', formatter: page.handleFormatter,hidden:!hasRight,opt:true},
                    {title: '部门编码', field: 'code', width: 120, align: 'center', sortable: true},
                    {title: '部门名称', field: 'name', width: 120, align: 'center', sortable: true}
                ]
            ],
            columns: [
                [
                    {title: '上级部门', field: 'parentName', width: 120, align: 'center', sortable: true},
                    {title: '部门性质', field: 'deptType', width: 120, align: 'center', sortable: true},
                    {title: '状态', field: 'statusName', width: 120, align: 'center', sortable: true}
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
    //初始化树
    initTree: function () {
        deptTree = coco.plugin.tree.deptOutTree({      //整个树
            treeId: "deptTree",
            onClick: function (node) {
                $("#dept").val(node.id);
                page.query();//刷新datagrid
            }
        });
        deptTree.tree("expand", deptTree.tree("getRoot").target);
        /*树展开一级*/
        deptTree.tree("select", deptTree.tree("getRoot").target);
        $("#dept").val(deptTree.tree("getRoot").id);
        $("#oneDept").checked = false;
    },
    oneDept: function (check) {
        if (check) {
            $("#oneDeptSelect").val(1);
            page.query();
            return;
        }
        $("#oneDeptSelect").val(0);
        page.query();
        return;
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
                page.initTree();
               page.query();
            }
        });
    },
    exportExcel: function () {
        coco.utils.exportDataExA("tbList", pageParam.filterStr, pageParam.title,"queryForm");
    },
    //查询时的条件验证；
    checkValid: function () {
        return true;
    },
    saveColsWidth: function () {
        coco.eui.grid.saveColsWidth(pageParam.key, "tbList", true);
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
