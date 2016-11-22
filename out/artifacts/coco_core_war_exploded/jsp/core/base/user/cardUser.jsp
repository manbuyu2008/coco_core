<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.base.common.ActionContext" %>
<%@ page import="com.coco.base.common.PageInfo" %>
<%@ page import="com.coco.base.util.UtilPub" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/pepper-grinder/easyui.css"
      id="swicth-style-base2"/>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/themes/base/base.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/common/common_card.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH%>/jsp/core/base/user/cardUser.js"></script>
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

        <a id='pwdDef' href="###" class="easyui-linkbutton" iconCls='icon-reload'      plain="false"
           onclick="page.pwdDef()">密码重置
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
            <td class='coco_caption' colspan="2">[人员基本信息]</td>
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
            <td nowrap class="p_td_lbl">用户名：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="name" name="name" class="coco_input easyui-validatebox"  required="true"
                       missingMessage="用户名必须输入"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">所属部门：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="dept" name="dept" class="coco_input" />
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">权限部门：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="adminDept" name="adminDept" class="coco_input" />
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">职称：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="postName" name="postName"
                       required="true" class="coco_input easyui-validatebox" validType="validName['职称',false,20]"/>
            </td>
        </tr>

        <tr class="p_tr">
            <td nowrap class="p_td_lbl">性别：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="sex" name="sex" class="coco_input"
                       required="true" missingMessage="请选择性别"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">出生日期：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="birthdate" name="birthdate" class="coco_input easyui-datebox"  required="true"/>
            </td>
        </tr>     


        <tr class="p_tr">
            <td class='coco_caption' colspan="6">[联系信息]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">办公电话：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="officeTel" name="officeTel" class="coco_input easyui-validatebox"  value=""
                       validType="validName['办公电话',false,20]"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">手机号码：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="mobile" name="mobile" class="coco_input easyui-validatebox"
                       validType="validName['手机号码',false,20]"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">住宅电话：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="homeTel" name="homeTel" class="coco_input easyui-validatebox"
                       validType="validName['住宅电话',false,20]"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">电子邮箱：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="email" name="email" class="coco_input"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td class='coco_caption' colspan="6">[其他信息]</td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">状态：</td>
            <td nowrap class="coco_txt" colspan="4">
                <input type="text" id="status" name="status" class="coco_input easyui-validatebox" />
            </td>
        </tr>
        <tr class="p_tr tr_stopInfo">
            <td nowrap class="p_td_lbl">停用时间：</td>
            <td nowrap class="coco_txt">
                <input type="text" id="stopTime" name="stopTime" class="coco_input easyui-datebox"  required="true"/>
            </td>
        </tr>
        <tr class="p_tr tr_stopInfo">
            <td nowrap class="p_td_lbl">停用信息：</td>
            <td nowrap class="coco_txt" colspan="4">
                <input type="text" id="stopInfo" name="stopInfo" style="width:100%"/>
            </td>
        </tr>
        <tr class="p_tr">
            <td nowrap class="p_td_lbl">备注：</td>
            <td nowrap class="coco_txt" colspan="4">
                <textarea id="desc" name="desc" cols="3" rows="3"
                          style="width:100%;font-size: 12px;" class="easyui-validatebox"
                          validType="validName['备注',false,200]"></textarea>
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