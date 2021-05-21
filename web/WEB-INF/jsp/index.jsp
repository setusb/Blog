<%--
  User: setusb
  Date: 2021/4/16
  Time: 16:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../../resources/layui/css/layui.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>欢迎访问吊毛猫之家 - 主页</title>
</head>
<body>
<ul class="ul_point">
    <span></span>
</ul>
<div class="login_register_zz">
    <div class="login_register layui-anim layui-anim-down">
        <form>
            <div class="layui-form-item" id="a1">
                <label class="layui-form-label">用户名 :</label>
                <div class="layui-input-block">
                    <input id="username" type="text" name="username" required lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="a2">
                <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码 :</label>
                <div class="layui-input-block">
                    <input id="password" type="password" name="password" required lay-verify="required"
                           placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div id="a3">
                <button type="button" onclick="logIn()" class="layui-btn">登录</button>
                <button type="reset" class="layui-btn layui-btn-danger">重置</button>
                <button type="button" id="close" class="layui-btn layui-btn-warm">关闭</button>
            </div>
            <span id="s1">●&nbsp;<a href="/requestRegister">点我前往注册</a></span>
        </form>
        <span id="s2"><a href="#" style="text-decoration: none;color: red" title="管理员点击此处进行登录">管理员登录</a></span>
    </div>
</div>

<div class="searchBar layui-anim layui-anim-down">
    <input id="searchContent" class="layui-input" placeholder="请输入搜索的内容">
    <button onclick="searchClick()" class="layui-btn layui-btn-warm">搜索</button>
</div>
<%@include file="index/nav.jsp" %>
<%@include file="index/carousel.jsp" %>
<%@include file="index/content.jsp" %>
<%@include file="index/footer.jsp" %>

<div class="gradient-pattern"></div>

</body>
<script>
    function searchClick() {
        var sc = $('#searchContent').val();
        if ($('#searchContent').val() === '') {
            $('.ul_point>span').text("请输入内容");
            $('.ul_point').css({
                display: "block"
            });
            setTimeout(function () {
                $('.ul_point').css({
                    display: "none"
                })
            }, 1000);
        } else {
            window.location.href = "/search/" + sc;
        }
    }
</script>
<style>
    .layui-btn-warm {
        background-color: #dc673d;
    }

    .searchBar {
        display: none;
        position: absolute;
        width: 400px;
        height: 38px;
        z-index: 10000;
        left: 35%;
        top: 50px;
        background-color: white;
        padding: 10px;
        box-shadow: 0 0 20px gray;
        border-radius: 10px;
        transform: translate(-50%);
    }

    .searchBar input {
        width: 320px;
        display: inline-block;
        box-shadow: 0 0 10px gray;
        border-radius: 5px;
    }

    .searchBar button {
        border-radius: 5px;
        float: right;
        box-shadow: 0 0 10px gray;
    }
</style>
<script src="../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../resources/layui/layui.js"></script>
<script>

    layui.use('carousel', function () {

        let carousel = layui.carousel;

        carousel.render({
            elem: '#test1'
            , width: '1080px'
            , height: '300px'
            , arrow: 'always'
        });
    });

    $(function () {

        $('#search').click(function () {
            $('.searchBar').toggle();
        });

        var loginSuccessful = '<%= session.getAttribute("loginSuccessful")%>';

        $('.nav_btn').click(function () {
            $('.nav_btn_s').toggle();
        });

        $('.li_login').click(function () {
            $('.login_register_zz').toggle();
            $('.searchBar').css({display: 'none'})
        });

        $('#close').click(function () {
            $('.login_register_zz').toggle();
        });

        if (loginSuccessful.length === 4) {
            $('.li_login').css({
                display: "block"
            });
            $('.sign_Out').css({
                display: "none"
            });
        } else {
            $('.li_login').css({
                display: "none"
            });
            $('.sign_Out').css({
                display: "block"
            });
            $.ajax({
                type: "POST",
                url: "/userInfoJson",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {
                    "uuid": loginSuccessful
                },
                dataType: "json",
                success: function (response) {
                    var user = response['user'];
                    $.each(user, function (index, obj) {
                        $('#unames').text(obj['nickname'])
                    });
                }
            })
        }
    });

    function logIn() {
        if ($('#username').val() != '' && $("#password").val() != '') {
            $.ajax({
                async: false,
                type: "POST",
                url: "/userjson",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {
                    "name": $('#username').val(),
                    "password": $("#password").val()
                },
                dataType: "json",
                success: function (response) {
                    var user = response['user'];

                    /*
                                    $.each(user, function (index, obj) {
                                        console.log(obj['nickname'])
                                    });
                    */

                    if (response['flag']) {
                        $('.ul_point>span').text("登录成功，正在跳转");
                        $('.ul_point').css({
                            display: "block"
                        })
                        setTimeout(function () {
                            $('.ul_point').css({
                                display: "none"
                            })
                        }, 1000);
                        setTimeout(function () {
                            window.location.replace("index");
                        }, 2000);
                    } else {
                        $('.ul_point>span').text("登录失败");
                        $('.ul_point').css({
                            display: "block"
                        })
                        setTimeout(function () {
                            $('.ul_point').css({
                                display: "none"
                            })
                        }, 1000);
                    }
                },
                error: function () {
                    alert("数据获取失败")
                }
            });
        } else {
            $('.ul_point>span').text("请输入用户名和密码");
            $('.ul_point').css({
                display: "block"
            })
            setTimeout(function () {
                $('.ul_point').css({
                    display: "none"
                })
            }, 1000);
        }
    }
</script>
<style>
    .nav_btn {
        width: 36px;
        height: 36px;
        position: fixed;
        top: 80%;
        left: 10px;
        color: black;
        background: #dc673d;
        padding: 0;
        font-size: 20px;
    }

    .nav_btn_s {
        display: none;
    }

    .title_Nav {
        height: 60px;
        position: relative;
        background: #dc673d;
    }

    .title_Nav a {
        color: white;
        align-content: center;
        font-size: 30px;
        position: absolute;
        left: 50%;
        line-height: 60px;
        transform: translate(-50%);
        font-weight: bold;
    }

    .layui-nav-tree .layui-nav-bar {
        background-color: #000000;
        border-radius: 20%;
    }

    .layui-nav-itemed > .layui-nav-child {
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    .layui-nav-tree .layui-nav-item a:hover {
        background-color: transparent;
    }

    .login_register_zz {
        width: 100%;
        height: 100%;
        background: rgba(212, 212, 212, 0.6);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=rgba(212, 212, 212, 0.6), endColorstr=rgba(212, 212, 212, 0.6));
        position: fixed;
        z-index: 1000;
        display: none;
    }

    .login_register {
        width: 400px;
        height: 300px;
        position: relative;
        z-index: 9999;
        background-color: white;
        /*        top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);*/
        margin: 120px auto;
        border-radius: 20px;
        box-shadow: 0 0 10px #4b482e;
        border: 10px solid #e87f0e;
    }

    .login_register form {
        margin: 20px auto;
        position: relative;
        width: 360px;
        height: 220px;
    }

    #username {
        margin: 0 auto;
    }

    #a1 {
        position: absolute;
        top: 50px;
    }

    #a2 {
        position: absolute;
        top: 100px;
    }

    #a3 {
        position: absolute;
        width: 300px;
        top: 180px;
        left: 75px;
    }

    #s1 a:hover {
        color: red;
    }

    .layui-anim {
        animation-duration: .5s;
    }

    .ul_point {
        z-index: 99999;
        position: fixed;
        width: 260px;
        height: 50px;
        left: 50%;
        top: 30px;
        border-radius: 5px;
        box-shadow: 0 0 10px gray;
        transform: translate(-50%);
        background-color: white;
        display: none;
    }

    .ul_point span {
        line-height: 50px;
        position: absolute;
        left: 50%;
        transform: translate(-50%);
    }

    .layui-nav .layui-this:after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed:after {
        background-color: transparent;
    }

    #s2 {
        position: absolute;
        left: 30px;
    }

    .li_login a {
        color: #eeeeee;
        cursor: pointer;
    }

    .li_login a:hover {
        color: white;
    }

    .content_ul {
        width: 1080px;
        margin: 10px auto;
    }

    .content_ul li {
        width: auto;
        height: 100px;
        line-height: 50px;
        margin: 10px auto;
        background-image: linear-gradient(#eceaea, #a0a0a0);
        border-radius: 10px;
        box-shadow: 0 0 10px gray;
    }

    .content_ul li a {
        font-size: 20px;
        margin-left: 20px;
        letter-spacing: 2px;
    }

    .content_ul li p {
        margin-left: 20px;
    }

    .content_ul li a:hover {
        color: red;
        transition: .5s;
    }

    .footer {
        width: 1080px;
        height: 30px;
        margin: 0 auto;
    }


    .gradient-pattern {
        -webkit-box-sizing: content-box;
        -moz-box-sizing: content-box;
        box-sizing: content-box;
        width: 100%;
        height: 100%;
        z-index: -999999;
        border: none;
        position: fixed;
        top: 0;
        font: normal 100%/normal Arial, Helvetica, sans-serif;
        color: rgba(255, 255, 255, 1);
        -o-text-overflow: clip;
        text-overflow: clip;
        background: -webkit-linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), -webkit-linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), rgb(255, 255, 255);
        background: -moz-linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), -moz-linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), rgb(255, 255, 255);
        background: linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), linear-gradient(45deg, rgba(0, 0, 0, 0.0980392) 25%, rgba(0, 0, 0, 0) 25%, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.0980392) 75%, rgba(0, 0, 0, 0.0980392) 0), rgb(255, 255, 255);
        background-position: 0 0, 40px 40px;
        -webkit-background-origin: padding-box;
        background-origin: padding-box;
        -webkit-background-clip: border-box;
        background-clip: border-box;
        -webkit-background-size: 80px 80px;
        background-size: 80px 80px;
    }

</style>
</html>