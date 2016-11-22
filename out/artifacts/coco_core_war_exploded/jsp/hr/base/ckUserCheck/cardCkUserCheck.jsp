<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.coco.base.consts.BaseConsts" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>打卡管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/common/common_card.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/hr/base/ckUserCheck/cardCkUserCheck.js"></script>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    //列表模型
    ActionContext context = (ActionContext)request.getAttribute("context");
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
    <input type="hidden" id="privType" name="privType" />
    <table id="sys__card" class="p_tbl" cellspacing="1" cellpadding="0">
        <tbody>
        <tr class="p_tr">
            <td class='coco_caption' colspan="2">[打卡基本信息]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl" style="width:15%">用户：</td>
            <td nowrap class="coco_txt" style="width:85%">
                <input type="text" id="userId" name="userId"
                        class="coco_input easyui-validatebox" required="true"
                       >
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">打卡日期：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="checkDate" name="checkDate" class="coco_input easyui-validatebox"
                       required="true" />
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">打卡时间：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="checkTime" name="checkTime" class="coco_input easyui-validatebox" value=""
                       required="true" >
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">打卡类型：</td>
            <td nowrap class="coco_txt" colspan="4">
                <input type="text" id="checkType" name="checkType" class="coco_input easyui-validatebox"
                       required="true" >
            </td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    var pageParam = $.extend({
        dataPriv:{
            data: <%=BaseConsts.DataPrivInfo.toJson()%>,
            type: {
                user: <%=BaseConsts.DataPrivInfo.user.value()%>,
                userDept: <%=BaseConsts.DataPrivInfo.user_dept.value()%>,
                userDeptChild: <%=BaseConsts.DataPrivInfo.user_dept_child.value()%>,
                userCorp: <%=BaseConsts.DataPrivInfo.user_corp.value()%>
            }
        },
        jsonObject:<%=jsonObject.toString()%>,
        queryParams:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("queryParams"),"{}")%>,
        pageSize:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageSize"),"20")%>,
        pageNumber:<%=UtilPub.checkEmpty(map.getStrIgnoreNull("pageNumber"),"1")%>
    }, pageParam || {});
</script>
</body>
</html>