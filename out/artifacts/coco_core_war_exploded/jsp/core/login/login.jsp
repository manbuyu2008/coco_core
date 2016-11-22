<%@ page import="com.coco.init.ParamsConfig" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/core/common/common.jsp" %>
<script type="text/javascript">
    var p = window.parent;
    if (p.parent && p != window) {
        while (p.parent && p.parent != p) {
            p = p.parent
        }
        p.location = "login";
    }
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel="stylesheet" href="<%= CONTEXT_PATH %>/resources/css/themes/login/style.css">
<script type="text/javascript" src="<%=CONTEXT_PATH%>/resources/js/jquery/jquery.cookie.js"></script>
<script src="<%= CONTEXT_PATH %>/jsp/core/login/login.js" ></script>
</head>
<%
 boolean sa = ParamsConfig.getInstance().getPropertyBoolValue("isLoginVerify");
%>
<script type="text/javascript">
    var pageParam = {
        is_force_test: <%=SysParam.is_force_test%>,
        sysName:"<%=ParamsConfig.getFullSysName()%>",
        isLoginVerify: <%=ParamsConfig.getInstance().getPropertyBoolValue("isLoginVerify")%>,
        canEmptyPwd: <%=ParamsConfig.getInstance().getPropertyBoolValue("canEmptyPwd")%>
    };
</script>
<body>
<div class="login">
    <h2><%=sysName%></h2>

    <div class="login-top">
        <h1>用户登录</h1>
        <form action="#">
            <input type="text" id ="code" name="code" class="code" required="true"
                   value="请输入用户帐号"
                   onfocus="if (this.value == ''||this.value=='请输入用户帐号')this.value = '';"
                   onblur="if (this.value == '') {this.value = '请输入用户帐号';}">
            <input type="password" id ="pwd" name="pwd" class="pwd" required="true"
                   value="请输入密码"
                   onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = '请输入密码';}">
            <input type="text" id="verifyCode" name="verifyCode" required="true" class="verifyCode" maxlength="4"
                   value="请输入验证码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入验证码';}">
            <img img alt="验证码"
                 id="imgVerifyCode" src="verifyCode"
                 title="看不清?，点击更换"
                 onclick="$('#imgVerifyCode').attr('src', 'verifyCode?t=' + Math.random())"/>
            <div class="forgot">
                <input type="v_submit" value="  登录" onclick="v_login.doLogin()" align="center" readonly="readonly">
                <input type="reset" value="重置">
            </div>
        </form>
    </div>
    <div class="login-bottom">
        <h3>为了你更好的使用 我们在不懈努力</h3>
    </div>
</div>
</body>
</html>

