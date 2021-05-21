<%--
  User: setusb
  Date: 2021/4/18
  Time: 12:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="resources/layui/css/layui.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>吊毛猫之家 - 注册</title>
</head>
<body>
<ul class="ul_point">
    <span></span>
</ul>
<form class="reigster_form layui-anim layui-anim-scale">
    <div class="rd">
        <p>
            <span>用&nbsp;&nbsp;户&nbsp;&nbsp;名: </span><input id="username" type="text" placeholder="请输入用户名"
                                                             class="layui-input">
        </p>
        <p>
            <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: </span><input id="nickname" type="text"
                                                                              placeholder="请输入昵称" class="layui-input">
        </p>
        <p>
            <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: </span><input id="password" type="text"
                                                                              placeholder="请输入密码" class="layui-input">
        </p>
        <p>
            <span>确认密码: </span><input id="confirmpassowrd" type="password" placeholder="请确认密码" class="layui-input">
        </p>
        <p>
            <span>选择性别: </span>
            <select id="sex" name="sex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </p>
        <p style="display: inline">
            <span>个人简介: </span><textarea id="userinfo" placeholder="请输入你的个人信息" class="layui-textarea"></textarea>
        </p>
        <div class="btn">
            <button id="register_btn" onclick="registerUser()" class="layui-btn" type="button">注册</button>
            <button id="reset_btn" class="layui-btn layui-btn-danger" type="reset">重置</button>
            <button id="back_btn" onclick="back()" class="layui-btn layui-btn-normal" type="reset">返回</button>
        </div>
    </div>
</form>
<div class="gradient-pattern"></div>
</body>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/layui/layui.js"></script>
<script>
    function back() {
        window.location.replace("index");
    }

    $(function () {

    });

    function registerUser() {

        var password = $('#password').val().trim();
        var confirmpassowrd = $('#confirmpassowrd').val()
        var username = $('#username').val().trim();
        var nickname = $('#nickname').val().trim();

        if (nickname === '' && username === '') {
            $('.ul_point>span').text("请输入用户名或昵称");
            $('.ul_point').css({
                display: "block"
            });
            setTimeout(function () {
                $('.ul_point').css({
                    display: "none"
                })
            }, 1000);
        } else if (password === confirmpassowrd && password !== '' && password.length >= 6) {
            $.ajax({
                async: false,
                type: "POST",
                url: "/registerUser",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {
                    "username": $('#username').val(),
                    "nickname": $('#nickname').val(),
                    "password": $('#password').val(),
                    "sex": $('#sex').val(),
                    "userinfo": $('#userinfo').val()
                },
                dataType: "json",
                success: function (res) {
                    if (res['flag']) {
                        $('.ul_point>span').text("注册成功，正在跳转");
                        $('.ul_point').css({
                            display: "block"
                        });
                        setTimeout(function () {
                            $('.ul_point').css({
                                display: "none"
                            })
                        }, 1000);
                        setTimeout(function () {
                            window.location.href = "/index"
                        }, 2000);
                    } else {
                        $('.ul_point>span').text("用户名冲突，请更换");
                        $('.ul_point').css({
                            display: "block"
                        });
                        setTimeout(function () {
                            $('.ul_point').css({
                                display: "none"
                            })
                        }, 1000);
                    }
                }
            });
        } else {
            $('.ul_point>span').text("密码长度大于或等于6");
            $('.ul_point').css({
                display: "block"
            });
            setTimeout(function () {
                $('.ul_point').css({
                    display: "none"
                })
            }, 1000);
        }
    }
</script>
<style>
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
        color: rgba(255,255,255,1);
        -o-text-overflow: clip;
        text-overflow: clip;
        background: -webkit-linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), -webkit-linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), rgb(255, 255, 255);
        background: -moz-linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), -moz-linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), rgb(255, 255, 255);
        background: linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), linear-gradient(45deg, rgba(0,0,0,0.0980392) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 75%, rgba(0,0,0,0.0980392) 75%, rgba(0,0,0,0.0980392) 0), rgb(255, 255, 255);
        background-position: 0 0, 40px 40px;
        -webkit-background-origin: padding-box;
        background-origin: padding-box;
        -webkit-background-clip: border-box;
        background-clip: border-box;
        -webkit-background-size: 80px 80px;
        background-size: 80px 80px;
    }

    .reigster_form {
        background-color: white;
        width: 450px;
        height: 430px;
        box-shadow: 0 0 10px gray;
        margin: 120px auto;
        position: relative;
        border-radius: 12px;
    }

    .rd {
        width: 250px;
        margin: 0 auto;
        padding: 30px 0;
    }

    .reigster_form p {
        margin: 10px 0;
    }

    .layui-anim {
        animation-duration: .5s;
    }

    .layui-input {
        width: 175px;
        height: 30px;
        display: inline;
    }

    #sex {
        width: 100px;
        line-height: 1.3;
        background-color: #fff;
        border-radius: 2px;
        color: gray;
        border: 1px solid gainsboro;
    }

    .btn {
        margin: 20px 0 0 10px;
    }

    .ul_point {
        z-index: 9999;
        position: fixed;
        width: 300px;
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
</style>
</html>