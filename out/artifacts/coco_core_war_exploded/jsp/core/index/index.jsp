<%@ page import="com.coco.core.user.UserBean" %>
<%@ page import="com.coco.key.login.LoginInfoBuffer" %>
<%@ page import="com.coco.key.login.LoginInfo" %>
<%@ page import="com.coco.core.dept.DeptBean" %>
<%@ page import="com.coco.base.common.PageMap" %>
<%@ page import="com.coco.core.menu.MenuBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<%
    //参数对象
    PageMap map = (PageMap) request.getAttribute("map");
    List<MenuBean> menuBeans = (List<MenuBean>) map.getObject("menu");
    UserBean userBean = new UserBean();
    DeptBean deptBean = null;
    LoginInfo loginInfo = LoginInfoBuffer.getInstance().getLoginInfo(request);
    if (loginInfo != null) {
        userBean = loginInfo.userBean;
        if (userBean != null) {
            deptBean = userBean.getDeptBean();
        }
    }
%>
<link rel="stylesheet" type="text/css" href="<%=CONTEXT_PATH %>/resources/css/themes/core/index.css"/>
<script type="text/javascript" src="<%=CONTEXT_PATH %>/resources/js/themes/index/indexLook.js"></script>
<script type="text/javascript" src="<%=CONTEXT_PATH %>/resources/js/themes/index/indexControl.js"></script>
</head>
<body class="easyui-layout">
<div region="north" border="true" class="cs-north">
    <div class="cs-north-bg">
        <div class="cs-north-logo"><%=sysName%>
        </div>
        <ul class="ui-skin-nav">
            <li class="li-skinitem" title="gray"><span class="gray" rel="gray"></span></li>
            <li class="li-skinitem" title="pepper-grinder"><span class="pepper-grinder" rel="pepper-grinder"></span>
            </li>
            <li class="li-skinitem" title="blue"><span class="blue" rel="blue"></span></li>
            <li class="li-skinitem" title="cupertino"><span class="cupertino" rel="cupertino"></span></li>
            <li class="li-skinitem" title="dark-hive"><span class="dark-hive" rel="dark-hive"></span></li>
            <li class="li-skinitem" title="sunny"><span class="sunny" rel="sunny"></span></li>
        </ul>
        <ul class="ui-skin-nav">
            <li class="head"><span>欢迎您:<font color="#dc143c"><%=userBean.getName()%>
            </font>[<font color="#d2691e"><%=deptBean == null? "" : deptBean.getName()%>
            </font>] <a href="#" id="editpass">修改密码</a> <a href="#"
                                                           id="loginOut">安全退出</a></span></li>
        </ul>
    </div>
</div>
<div region="west" border="true" split="true" title="用户菜单" class="cs-west" collapsible="true">
    <div class="easyui-accordion" fit="true" border="false">
        <%
            for (MenuBean menuBean : menuBeans) {
                if (menuBean.getLevelNum() == 1) {
        %>
        <div title="<%=menuBean.getName()%>">
            <ul>
                <%
                    for (MenuBean menuBean_next : menuBeans) {
                        if (menuBean_next.getLevelNum() == 2 && menuBean.getId().equals(menuBean_next.getParentId())) {
                %>
                <li>
                    <div class="">
                        <a href="javascript:void(0);" src="<%=menuBean_next.getMenuUrl()%>" class="cs-navi-tab">
                            <span class="icon <%=menuBean_next.getMenuIcon()%>">&nbsp;</span>
                            <span class="nav"><%=menuBean_next.getName()%></span></a>
                    </div>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
        <%
                }
            }
        %>
        <%--<div title="系统管理">--%>
            <%--<ul>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="core/dept/Dept/list" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-nav">&nbsp;</span>--%>
                            <%--<span class="nav">部门管理</span></a>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="core/user/User/list" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-users">&nbsp;</span>--%>
                            <%--<span class="nav">用户管理</span>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="core/menu/Menu/list" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-users">&nbsp;</span>--%>
                            <%--<span class="nav">菜单管理</span>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-role">&nbsp;</span>--%>
                            <%--<span class="nav">角色管理</span></a></div>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-set">&nbsp;</span>--%>
                            <%--<span class="nav">权限设置</span></a></div>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<div class="">--%>
                        <%--<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">--%>
                            <%--<span class="icon icon-log">&nbsp;</span>--%>
                            <%--<span class="nav">系统日志</span></a>--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div title="Layout">--%>
            <%--<a href="javascript:void(0);" src="demo/accordion.html" class="cs-navi-tab">accordion</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/layout.html" class="cs-navi-tab">layout</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/layout1.html" class="cs-navi-tab">layout1</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/layout2.html" class="cs-navi-tab">layout2</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/panel.html" class="cs-navi-tab">panel</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/panel2.html" class="cs-navi-tab">panel1</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/tabs.html" class="cs-navi-tab">tabs</a></p>--%>
        <%--</div>--%>
        <%--<div title="Menu and ButtonBean">--%>
            <%--<a href="javascript:void(0);" src="demo/menu.html" class="cs-navi-tab">menu</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/menubutton.html" class="cs-navi-tab">menubutton</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/linkbutton.html" class="cs-navi-tab">linkbutton</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/splitbutton.html" class="cs-navi-tab">splitbutton</a></p>--%>
        <%--</div>--%>
        <%--<div title="Form">--%>
            <%--<a href="javascript:void(0);" src="demo/form.html" class="cs-navi-tab">form</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/validatebox.html" class="cs-navi-tab">validatebox</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/combo.html" class="cs-navi-tab">combo</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/combobox.html" class="cs-navi-tab">combobox</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/combotree.html" class="cs-navi-tab">combotree</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/combogrid.html" class="cs-navi-tab">combogrid</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/numberbox.html" class="cs-navi-tab">numberbox</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/numberbox2.html" class="cs-navi-tab">numberbox1</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/datebox.html" class="cs-navi-tab">datebox</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/datetimebox.html" class="cs-navi-tab">datetimebox</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/calendar.html" class="cs-navi-tab">calendar</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/timespinner.html" class="cs-navi-tab">timespinner</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/numberspinner.html"--%>
               <%--class="cs-navi-tab">numberspinner</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/slider.html" class="cs-navi-tab">slider</a></p>--%>
        <%--</div>--%>
        <%--<div title="Window">--%>
            <%--<a href="javascript:void(0);" src="demo/window.html" class="cs-navi-tab">window</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/dialog.html" class="cs-navi-tab">dialog</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/messager.html" class="cs-navi-tab">messager</a></p>--%>
        <%--</div>--%>
        <%--<div title="DataGrid and Tree">--%>
            <%--<a href="javascript:void(0);" src="demo/datagrid.html" class="cs-navi-tab">datagrid</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/propertygrid.html" class="cs-navi-tab">propertygrid</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/tree.html" class="cs-navi-tab">tree</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/tree2.html" class="cs-navi-tab">tree1</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/treegrid.html" class="cs-navi-tab">treegrid</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/treegrid2.html" class="cs-navi-tab">treegrid1</a></p>--%>
            <%--<a href="javascript:void(0);" src="demo/treegrid3.html" class="cs-navi-tab">treegrid2</a></p>--%>
        <%--</div>--%>
    </div>
</div>
<div id="mainPanle" region="center" border="true" border="false">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="首页">
            <div class="cs-home-remark">
                <h1>jQuery EasyUI 1.3.0 Demo</h1> <br>
                制作：黄兴良 <br>
                博客：<a href="http://www.baidu.com" target="_blank">http://www.baidu.com</a><br>
                说明：jQuery EasyUI 1.3.0 Demo分类整理。
            </div>
        </div>
    </div>
</div>
<!--修改密码窗口-->
<div id="pwd_chg" icon="icon-list">
    <table cellpadding=3>
        <tr>
            <td>旧密码<font color="red">*</font> ：</td>
            <td><input type="password" id="txtOldPass" class="txt01" value=""/></td>
        </tr>
        <tr>
            <td>新密码<font color="red">*</font>：</td>
            <td><input type="password" id="txtNewPass" class="txt01" value=""/></td>
        </tr>
        <tr>
            <td>确认密码<font color="red">*</font>：</td>
            <td><input type="password" id="txtRePass" class="txt01" value=""/></td>
        </tr>
    </table>
</div>
<div region="south" border="false" class="cs-south"><%=ParamsConfig.getInstance().getPropertyValue("copyRight")%>
</div>

<div id="mm" class="easyui-menu cs-tab-menu">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭全部</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">右侧关闭</div>
    <div id="mm-tabcloseleft">左侧关闭</div>
</div>

</body>
</html>
