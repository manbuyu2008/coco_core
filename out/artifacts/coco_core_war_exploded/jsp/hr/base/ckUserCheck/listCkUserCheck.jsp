<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<%@ page import="com.coco.base.consts.BaseConsts" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>打卡管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/hr/base/ckUserCheck/listCkUserCheck.js"></script>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    //列表模型
    ActionContext context = (ActionContext) request.getAttribute("context");
    PageInfo pageInfo = (PageInfo) context.getPageInfo();
    int roleType = BaseConsts.PrivMaster.role.value();
    String privilegeValue = "," + UtilPub.checkNull(map.getStr("privilegeValue")) + ",";
    boolean isStart =map.getBoolean("isStart");
    boolean isEnd =map.getBoolean("isEnd");
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
        <%
            if (privilegeValue.indexOf(",inWork,") > -1) {
        %>
        <a id="inWork" href="#" class="easyui-linkbutton" iconCls='icon-add' plain="false"
           onclick="page.inWork(<%=isStart?"1":"0"%>)">上班打卡</a>
        <%
            }
            if (privilegeValue.indexOf(",outWork,") > -1) {
        %>
        <a id='outWork' href="###" class="easyui-linkbutton" iconCls='icon-add' plain="false"
           onclick="page.outWork(<%=isStart?"0":"1"%>)">下班打卡
        </a>
        <%
            }
        %>
    </div>
</div>
<div region="center" border="false">
    <div id="center-div" class="easyui-layout" fit="true">
        <div region="north" id="queryForm" title="查询条件" style="overflow:hidden; height: <%=privilegeValue.indexOf(",add,") > -1?"85":"65"%>px;"
             collapsible="true" collapsed="<%=ParamsConfig.getInstance().getPropertyBoolValue("isCollapsed")%>">
            <table id="form" class="p_tbl" cellspacing="1" cellpadding="0">
                <tbody>
                <input type="hidden" id="isManager" name="isManager" value="<%=privilegeValue.indexOf(",add,") > -1?"1":"0"%>">

                <tr class="p_tr">
                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>时间范围:</td>
                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                        <input type="hidden" id="checkDate" name="checkDate" class="coco_input" >
                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>打卡类型:</td>
                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                        <input id="checkType" name="checkType" class="easyui-validatebox coco_input"
                               value=""/>
                    </td>
                </tr>
                <tr class="p_tr" id="user_tr">
                    <td nowrap class='p_td_lbl' align='right' style='width:10%'>打卡人:</td>
                    <td nowrap class='coco_txt' align='left' style='width:20%'>
                        <input id="userId" name="userId" class="easyui-validatebox coco_input" />
                </tr>
                </tbody>
            </table>
        </div>
        <div region="center" border="false">

            <table id="tbList"></table>

        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var roleType = <%=roleType%>;
    var isStart = <%=isStart%>;
    var pageParam = $.extend({
        privilegeValue: "<%=privilegeValue%>",
        dataPriv: {
            data: <%=BaseConsts.DataPrivInfo.toJson()%>,
            type: {
                user: <%=BaseConsts.DataPrivInfo.user.value()%>,
                userDept: <%=BaseConsts.DataPrivInfo.user_dept.value()%>,
                userDeptChild: <%=BaseConsts.DataPrivInfo.user_dept_child.value()%>,
                userCorp: <%=BaseConsts.DataPrivInfo.user_corp.value()%>
            }
        },
        title: "<%=pageInfo==null?"":pageInfo.getMenuName()%>",
        queryParams: <%=UtilPub.checkEmpty(map.getStrIgnoreNull("queryParams"),"{}")%>,
        pageSize:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageSize"),"20")%>,
        pageNumber:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageNumber"),"1")%>,
        filterStr: "<%=map.getStrIgnoreNull("filterStr")%>"
    }, pageParam || {});
    document.title = pageParam.title;
</script>
</html>