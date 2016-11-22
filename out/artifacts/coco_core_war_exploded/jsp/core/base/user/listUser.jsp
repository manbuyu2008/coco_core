<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/base/user/listUser.js"></script>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    //列表模型
    ActionContext context = (ActionContext) request.getAttribute("context");
    PageMap responseParams = context.getResponseParams();
    PageMap requestParams = context.getRequestParams();
    PageInfo pageInfo = (PageInfo) context.getPageInfo();
    String privilegeValue = "," + UtilPub.checkNull(map.getStr("privilegeValue")) + ",";
%>
</head>
<body class="easyui-layout">
<div region="north" style="overflow:hidden;height:35px;" border="false">
    <div id="toolbar" class="coco_toolbar">
        <%
            if (privilegeValue.indexOf(",query,") > -1) {
        %>
        <a id='query' href="###" class="easyui-linkbutton " iconCls='icon-search' plain="false"
           onclick="page.query()">查询
        </a>
        <%
            }
            if (privilegeValue.indexOf(",add,") > -1) {
        %>
        <a id="btn" href="#" class="easyui-linkbutton" iconCls='icon-add' plain="false"
           onclick="page.card()">新增</a>
        <%
            }
            if (privilegeValue.indexOf(",export,") > -1) {
        %>
        <a id='excel' href="###" class="easyui-linkbutton" iconCls='icon-reload' plain="false"
           onclick="page.exportExcel()">导出
        </a>
        <%
            }
        %>
    </div>
</div>
<div region="center" border="false">
    <div id="center-div" class="easyui-layout" fit="true">
        <div region="center" border="false">
            <div id="layout" class="easyui-layout" data-options="fit:true">
                <div id="leftDiv" title="部门选择" data-options="region:'west',split:true,border:true,tools:'#tt'"
                     style="width:200px">
                    <%--部门树，动态创建--%>
                    <ul id="deptTree" class="easyui-tree" animate="false"></ul>
                </div>
                <div id="tt">
                    <input id="oneDept" type="checkbox" value="仅本级"
                           onclick="page.oneDept(this.checked)"/>
                    <label for="oneDept" style="vertical-align:middle;">仅本级</label>
                    <a class="layout-button-left" href="javascript:void(0)" onclick="collapse()"></a>
                </div>
                <div data-options="region:'center',border:false">
                    <div id="center-right-div" class="easyui-layout" fit="true">
                        <div region="north" id="queryForm" title="查询条件" style="overflow:hidden; height: 95px;"
                             collapsible="true"
                             collapsed="<%=ParamsConfig.getInstance().getPropertyBoolValue("isCollapsed")%>">
                            <table id="form" class="p_tbl" cellspacing="1" cellpadding="0">
                                <tbody>
                                <input type="hidden" id="dept" name="dept" value="">
                                <input type="hidden" id="oneDeptSelect" name="oneDeptSelect" value="0">
                                <tr class="p_tr">
                                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>编码:</td>
                                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                                        <input type="text" id="code" name="code" class="easyui-validatebox coco_input"
                                               value="">
                                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>名称:</td>
                                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                                        <input id="name" name="name" class="easyui-validatebox coco_input"
                                               value=""/>
                                    </td>
                                </tr>
                                <tr class="p_tr">
                                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>部门名称:</td>
                                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                                        <input id="deptName" name="deptName" class="easyui-validatebox coco_input"
                                               value=""/>
                                    </td>
                                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>状态:</td>
                                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                                        <input id="status" name="status" class="coco_input" value=""/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div region="center" border="false">

                            <table id="tbList"></table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="panel-body panel-body-noheader layout-body"  id="exportChoose" title="数据导出"
     style="height: 320px; width: 710px;text-align: center;" >
</div>
<div id="role_grant" icon="icon-list" style="padding:5px;width:400px;height:180px;">
    <table class="p_tbl" cellspacing="1" cellpadding="0">
        <tbody>
        <tr class="p_tr">
            <td class='vp_caption' colspan="2">[角色授权]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">选择的人员：</td>
            <td nowrap class="vp_txt" id="selectedPerson">
                <input type="text" id="userId" name="userId" class="coco_input easyui-validatebox" value=""
                       disabled="disabled"
                       validType="validName['人员',false,100]"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">角色选择：</td>
            <td nowrap class="vp_txt">
                <input type="text" id="roleIds" name="roleIds" class="coco_input"
                       value="" required="true" missingMessage="角色选择必须输入"/>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
    var pageParam = $.extend({
        privilegeValue: "<%=privilegeValue%>",
        title: "<%=pageInfo==null?"":pageInfo.getMenuName()%>",
        queryParams:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("queryParams"),"{}")%>,
        pageSize:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("pageSize"),"20")%>,
        pageNumber:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("pageNumber"),"1")%>,
        filterStr: "<%=map.getStrIgnoreNull("filterStr")%>"
    }, pageParam || {});
    document.title = pageParam.title;
</script>
</html>