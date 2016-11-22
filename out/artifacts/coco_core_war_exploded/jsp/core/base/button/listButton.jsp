<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>按钮管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/base/button/listButton.js"></script>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    //列表模型
    ActionContext context = (ActionContext) request.getAttribute("context");
    PageMap responseParams = context.getResponseParams();
    PageMap requestParams = context.getRequestParams();
    PageInfo pageInfo = (PageInfo) context.getPageInfo();
%>
</head>
<body class="easyui-layout">
<div region="north" style="overflow:hidden;height:35px;" border="false">
    <div id="toolbar" class="coco_toolbar">
        <a id='query' href="###" class="easyui-linkbutton " iconCls='icon-search' plain="false"
           onclick="page.query()">查询
        </a>
        <a id="btn" href="#" class="easyui-linkbutton" iconCls='icon-add' plain="false"
           onclick="page.card()">新增</a>
        <a id='excel' href="###" class="easyui-linkbutton" iconCls='icon-reload' plain="false"
           onclick="page.exportExcel()">导出
        </a>

    </div>
</div>
<div region="center" border="false">
    <div id="center-div" class="easyui-layout" fit="true">
        <div region="north" id="queryForm" title="查询条件" style="overflow:hidden; height: 95px;"
             collapsible="true" collapsed="<%=ParamsConfig.getInstance().getPropertyBoolValue("isCollapsed")%>">
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
</body>
<script type="text/javascript">
    var pageParam = $.extend({
        title: "<%=pageInfo==null?"":pageInfo.getMenuName()%>",
        queryParams:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("queryParams"),"{}")%>,
        pageSize:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("pageSize"),"20")%>,
        pageNumber:<%=UtilPub.checkEmpty(responseParams.getStrIgnoreNull("pageNumber"),"1")%>,
        filterStr: "<%=map.getStrIgnoreNull("filterStr")%>"
    }, pageParam || {});
    document.title = pageParam.title;
</script>
</html>