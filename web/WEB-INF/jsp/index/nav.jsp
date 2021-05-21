<%--
  User: setusb
  Date: 2021/4/16
  Time: 16:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="layui-nav" style="user-select: none;background: #dc673d;border-radius: 0;width: 1080px;margin: 0 auto;box-shadow: 0 0 10px gray;">
    <li class="layui-nav-item"><a href="/index">首页</a></li>
<%--    <li class="layui-nav-item"><a href="">疑难解答</a></li>--%>
<%--    <li class="layui-nav-item">
        <a href="#">排行榜</a>
        <dl class="layui-nav-child">
            <dd><a href="">名人榜</a></dd>
            <dd><a href="">积分排行榜</a></dd>
            <dd><a href="">贡献排行榜</a></dd>
        </dl>--%>
    </li>
    <li class="layui-nav-item">
        <a id="search" style="cursor: pointer">搜索</a>
    </li>

    <li class="li_login" style="float: right;line-height: 60px"><a>登录 / 注册</a></li>

    <li class="sign_Out layui-nav-item" style="float: right">
        <a style="cursor: pointer"><img style="border: 3px solid white;padding: 2px" src="./resources/images/ava/ava.png" class="layui-nav-img"><span id="unames">null</span></a>
        <dl class="layui-nav-child">
            <dd><a href="/default/userinfo">个人信息</a></dd>
            <dd><a href="#">安全管理</a></dd>
<%--            <dd><a href="#">积分管理</a></dd>--%>
            <dd><a href="/signOut" style="color: red">退出登录</a></dd>
        </dl>
    </li>
</ul>
