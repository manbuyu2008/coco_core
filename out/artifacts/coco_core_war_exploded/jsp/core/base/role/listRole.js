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
    var ckWidth = (hasEdit?45:0)+(hasDel?45:0)+(hasGrant?50:0);
    page._init();
    page.initGrid(hasRight,ckWidth);
    sys_loaded();
}
var statusCombo;
var menuTree;
var page = {
    idField: "id",
    _init: function () {
        $('#queryForm').form('load', pageParam.queryParams);
        statusCombo = coco.plugin.combo.comboStatus({
            comboId: "status",
            canEmpty: true,
            value: $("#status").val()
        });
        $('#role_dialog').dialog({
            title: '角色授权',
            closed: true,
            closable: true,
            modal: true,
            resizable: true,
            buttons: [
                {
                    text: '确认',
                    iconCls: 'icon-ok',
                    handler: function () {
                        page.saveRole();
                    }
                },
                {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#role_dialog').dialog('close');
                    }
                }
            ],
            onOpen: function () {
                $('#role_dialog').dialog("resize", {});  //不加这个，右边边框显示有点问题
                $('#code').focus();
            }
        });
    },
    initGrid: function (hasRight,ckWidth) {
        var queryParams = coco.page.model.getCardDataStr("queryForm");
        var dataParams = { data: queryParams };
        $('#tbList').datagrid({
            title: "角色列表",
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
                    {title: '角色编码', field: 'code', width: 180, align: 'center', sortable: true},
                    {title: '角色名称', field: 'name', width: 180, align: 'center', sortable: true}
                ]
            ],
            columns: [
                [
                    {title: '数据权限', field: 'dataPriv', width: 120, align: 'center', sortable: true,
                        formatter: function (value, row, index) {
                            if (value == pageParam.dataPriv.type.user) {
                                return '本人';
                            } else if (value == pageParam.dataPriv.type.userDept) {
                                return '本部门';
                            } else if (value == pageParam.dataPriv.type.userDeptChild) {
                                return '本部门及下级部门';
                            } else if (value == pageParam.dataPriv.type.userCorp) {
                                return '本单位';
                            }
                        }
                    }
                ]
            ],
            pagination: true,
            rownumbers: true
        });
    },
    //保存角色授权
    saveRole: function () {
        var nodes = $('#menuTree').tree('getChecked');
        var s = '';
        for (var i = 0; i < nodes.length; i++) {
            if (s != '') s += ',';
            s += nodes[i].id;
        }
        if (s == '') {
            coco.utils.msg.slideError("请选择授权功能!");
            return false;
        }
        var relFlag = true;
        $.post("roleSave", {data: s, masterId: $("#masterId").val()}, function (data) {
            if (data.state) {
                $$msg.slideMsg("保存成功！");
            } else {
                $$msg.slideError(data.msg);
                relFlag = false;
                return false;
            }
            $$msg.closeWait();
        }, "json");
        return relFlag;
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
        if (hasGrant) s += "<a href='###' class='coco_opt' onclick=page.role('" + value + "','" + rowData["priv"] + "')>[角色授权]</a>";
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
    role: function (id,priv) {
        $("#masterId").val(id);
        page.initTree(priv);
        $('#role_dialog').dialog('open');
    },
    //初始化树
    initTree: function (priv) {
        menuTree = coco.plugin.tree.MenuOutTree({      //整个树
            treeId: "menuTree",
            isOnlySelectLeaf: false,
            hasDefRoot: false,
            multiple: true,
            checkbox: true,
            cascadeCheck: true,
            canUse: true,
            hasButtons: "1",
            hasShowCheck: "1",
            master: roleType,
            priv: priv,
            masterId: $("#masterId").val(),
            onClick: function (node) {
                $("#menu").val(node.id);
                page.query();//刷新datagrid
            }
        });
        if (menuTree) {
            menuTree.tree("collapseAll", menuTree.tree("getRoot").target);
            menuTree.tree("expand", menuTree.tree("getRoot").target);
        }
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
