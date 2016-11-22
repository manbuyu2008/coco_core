<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>菜单管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/common/common_card.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/base/menu/cardMenu.js"></script>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    //列表模型
    ActionContext context = (ActionContext)request.getAttribute("context");
    PageMap requestParams = context.getRequestParams();
    JSONObject jsonObject = (JSONObject)map.getObject("jsonObject");
    PageInfo pageInfo = (PageInfo)context.getPageInfo();
%>
</head>
<body class="easyui-layout">
<div region="north" style="overflow:hidden;height:35px;" border="false">
    <div id="toolbar" class="coco_toolbar">
        <a id='query' href="###" class="easyui-linkbutton " iconCls='icon-save'    plain="false"
           onclick="page.save()">保存
        </a>
        <a id="btn" href="#" class="easyui-linkbutton" iconCls='icon-saveadd'    plain="false"
           onclick="page.save(true)">保存并新增</a>
        <a id='excel' href="###" class="easyui-linkbutton" iconCls='icon-list'      plain="false"
           onclick="page.list()">列表
        </a>

    </div>
</div>
<div id="form" region="center" border="false" >
    <input type="hidden" id="id" name="id" />
    <input type="hidden" id="version" name="version" />
    <table id="sys__card" class="p_tbl" cellspacing="1" cellpadding="0">
        <tbody>
        <tr class="p_tr">
            <td class='coco_caption' colspan="2">[菜单基本信息]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl" style="width:15%">编码：</td>
            <td nowrap class="coco_txt" style="width:85%">
                <input type="text" id="code" name="code"
                        class="coco_input easyui-validatebox" required="true"
                       missingMessage="编码必须输入"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">菜单名称：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="name" name="name" class="coco_input easyui-validatebox"  required="true"
                       missingMessage="菜单名称必须输入"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">上级菜单：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="parentId" name="parentId" class="coco_input" />
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">菜单排序：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="menuOrder" name="menuOrder"
                       class="coco_input easyui-numberbox"  data-options="min:1"
                       required="true" />
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">是否末节点：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="isLeaf" name="isLeaf"
                       class="coco_input easyui-validatebox"
                       required="true" />
            </td>
        </tr>
        <tr class="p_tr tr_leaf">
            <td nowrap class="p_td_lbl">菜单链接：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="menuUrl" name="menuUrl"
                       required="true" class="coco_input easyui-validatebox"/>
            </td>
        </tr>
        <tr class="p_tr tr_leaf">
            <td nowrap class="p_td_lbl">菜单图标：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="menuIcon" name="menuIcon"
                       required="true" class="coco_input easyui-validatebox"/>
            </td>
        </tr>
        <tr class="p_tr tr_leaf">
            <td nowrap class="p_td_lbl">包含按钮：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="buttons" name="buttons"
                       required="true" class="coco_input easyui-validatebox"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td class='coco_caption' colspan="6">[其他信息]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">菜单级别：</td>
            <td nowrap class="coco_txt" colspan="4">
                <input type="text" id="status" name="status" class="coco_input easyui-validatebox"  disabled/>
            </td>
        </tr>
        <%--<tr class="p_tr tr_stopInfo">--%>
            <%--<td nowrap class="p_td_lbl">停用时间：</td>--%>
            <%--<td nowrap class="coco_txt">--%>
                <%--<input type="text" id="stopTime" name="stopTime" class="coco_input easyui-datebox"  required="true"/>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr class="p_tr tr_stopInfo">--%>
            <%--<td nowrap class="p_td_lbl">停用信息：</td>--%>
            <%--<td nowrap class="coco_txt" colspan="4">--%>
                <%--<input type="text" id="stopInfo" name="stopInfo" style="width:100%"/>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">备注：</td>
            <td nowrap class="coco_txt" colspan="4">
                <textarea id="note" name="note" cols="3" rows="3"
                          style="width:100%;font-size: 12px;" class="easyui-validatebox"
                          validType="validName['备注',true,200]"></textarea>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    var pageParam = $.extend({
        hasList:0,
        jsonObject:<%=jsonObject.toString()%>,
        queryParams:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("queryParams"),"{}")%>,
        pageSize:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageSize"),"20")%>,
        pageNumber:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageNumber"),"1")%>
    }, pageParam || {});
</script>
</body>
</html>