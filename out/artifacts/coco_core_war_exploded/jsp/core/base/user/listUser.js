$(function () {
    init();
    window.checkValid = page.checkValid;
});

function init() {
    var privilegeValue = pageParam.privilegeValue.trim();
    var hasEdit = privilegeValue.indexOfIgnoreCase(",edit,") > -1;
    var hasDel = privilegeValue.indexOfIgnoreCase(",del,") > -1;
    var hasGrant = privilegeValue.indexOfIgnoreCase(",roleGrant,") > -1;
    var hasRight = hasEdit || hasDel || hasGrant;
    var ckWidth = (hasEdit ? 45 : 0) + (hasDel ? 45 : 0) + (hasGrant ? 50 : 0);
    page._init();
    page.initTree();
    page.initGrid(hasRight, ckWidth);
    page.initDialog();
    sys_loaded();
}
function collapse() {
    $("#layout").layout("collapse", "west");
}
var deptTree;
var statusCombo;
var roleCombo;
var userCombo;
var exportChoose;
var page = {
    idField: "id",
    _init: function () {
        $('#queryForm').form('load', pageParam.queryParams);
        statusCombo = coco.plugin.combo.comboStatus({
            comboId: "status",
            canEmpty: true,
            value: $("#status").val()
        });
    },
    initDialog: function () {
        userCombo = coco.plugin.list.userList({
            listId: "userId",
            panelWidth: 400,
            required: true,
            canEmpty: false
        });
        roleCombo = coco.plugin.list.roleList({
            listId: "roleIds",
            panelWidth: 400,
            isAdmin: false,
            multiple: true,
            canSearch: true,
            required: true,
            canEmpty: false
        });
        $('#role_grant').dialog({
            title: '角色授权',
            closed: true,
            closable: false,
            modal: true,
            resizable: true,
            buttons: [
                {
                    text: '确认',
                    iconCls: 'icon-ok',
                    handler: function () {
                        coco.utils.ajaxPostData("./custom?actionType=roleGrant", {userId: userCombo.getValue(), roleIds: roleCombo.getValue()},
                            function (data) {
                                if (data) {
                                    coco.utils.msg.alert("角色授权成功");
                                    $('#role_grant').dialog('close');
                                    page.query();
                                } else {
                                    coco.utils.msg.slideError("角色授权失败");
                                }
                            });
                    }
                },
                {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#role_grant').dialog('close');

                    }
                }
            ]
        });

        exportChoose = coco.ctrl.dualSelect({
            objvarname: "conditionSelect",
            prefix: "_conditionSelect",
            parentId: "exportChoose",
            readonly: false,
            idField: "code",
            leftTitle: "导出字段选择",
            rightTitle: "已选择字段",
            canMove: true,
            notParse: false,
            leftCols: [
                {field: 'code', title: '编码', width: 80,hidden:true},
                {field: 'name', title: '字段名称', width: 80}
            ],
            rightCols: [
                {field: 'code', title: '编码', width: 80,hidden:true},
                {field: 'name', title: '字段名称', width: 80}
            ]
        });
        $('#exportChoose').dialog({
            title: '数据导出',
            closed: true,
            closable: false,
            modal: true,
            resizable: true,
            buttons: [
                {
                    text: '确认',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var conditionData = exportChoose.getSelectedRows();
                        var changeAfter=new Array()
                        for (var i = 0; i < conditionData.length; i++) {
                            changeAfter[i]= conditionData[i].code+"-"+conditionData[i].name;
                        }
                        var queryParams = coco.page.model.getCardDataJson("queryForm");
                        coco.utils.exportDataExA("tbList", pageParam.filterStr, pageParam.title,queryParams);
                    }
                },
                {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#exportChoose').dialog('close');

                    }
                }
            ]
        });
    },
    loadConditionData: function () {
        var LeftData = page.getExportAjax('exportInfo');
        LeftData = LeftData.data;
        if (coco.utils.str.isNotEmpty(LeftData)) {
            exportChoose.setLeftData(eval(LeftData));
        } else {
            exportChoose.setLeftData(eval("[]"));
        }
        exportChoose.setRightData(eval("[]"));
    },
    getExportAjax: function (methodName) {
        var data = coco.utils.ajaxPost("./custom?actionType=" + methodName);
        return  data;
    },
    initGrid: function (hasRight, ckWidth) {
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        var dataParams = { data: queryParams };
        $('#tbList').datagrid({
            title: "用户列表",
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
                    {field: page.idField, title: "操作", width: ckWidth, align: 'center', formatter: page.handleFormatter, hidden: !hasRight,opt:true},
                    {title: '登录编码', field: 'code', width: 80, align: 'center', sortable: true},
                    {title: '用户名', field: 'name', width: 80, align: 'center', sortable: true}
                ]
            ],
            columns: [
                [
                    {title: '部门名称', field: 'deptName', width: 120, align: 'center', sortable: true},
                    {title: '职位', field: 'postName', width: 120, align: 'center', sortable: true},
                    {title: '性别', field: 'sexName', width: 60, align: 'center', sortable: true},
                    {title: '办公电话', field: 'officeTel', width: 120, align: 'center', sortable: true},
                    {title: '手机', field: 'mobile', width: 120, align: 'center', sortable: true},
                    {title: '邮箱', field: 'email', width: 120, align: 'center', sortable: true},
                    {title: '所属角色', field: 'roleNames', width: 120, align: 'center', sortable: true},
                    {title: '所属角色ID', field: 'roleIds', width: 120, align: 'center', sortable: true, hidden: true, opt:true},
                    {title: '状态', field: 'statusName', width: 80, align: 'center', sortable: true}
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
    //初始化树
    initTree: function () {
        deptTree = coco.plugin.tree.deptOutTree({      //整个树
            treeId: "deptTree",
            status: "1",
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
        var hasGrant = privilegeValue.indexOfIgnoreCase(",roleGrant,") > -1;
        var s = "";
        if (hasEdit) s += "<a href='###' class='coco_opt' onclick=page.edit('" + value + "')>[详细]</a>&nbsp;";
        if (hasDel) s += "<a href='###' class='coco_opt' onclick=page.del('" + value + "')>[删除]</a>";
        if (hasGrant) s += "<a href='###' class='coco_opt' onclick=page.grant('" + value + "','" + rowData["roleIds"] + "')>[角色授权]</a>";
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
            if (success) {
                $("#tbList").datagrid("reload");
            }
        });
    },
    //角色授权
    grant: function (id, roleIds) {
        userCombo.setValue(id);
        roleCombo.setValue(roleIds);
        $('#role_grant').dialog('open');
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
