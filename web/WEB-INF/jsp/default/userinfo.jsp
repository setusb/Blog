<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: setusb
  Date: 2021/4/18
  Time: 16:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../../../resources/layui/css/layui.css" rel="stylesheet" type="text/css">
<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<%--<script src="../../../resources/layui/layui.js"></script>--%>
<script src="//unpkg.com/layui@2.6.4/dist/layui.js"></script>
<html>
<head>
    <title>吊毛猫之家 - 修改信息</title>
</head>
<body>
<ul class="ul_point">
    <span></span>
</ul>
<div class="a1">
    <div class="nav_btn" title="点击隐藏">三</div>
    <ul class="nav_btn_s layui-nav layui-nav-tree layui-anim layui-anim-down" lay-filter="test"
        style="box-shadow: 0 0 10px gray;background: #dc673d;width: 120px;margin: 10px 10px">
        <li id="jbxx" class="layui-nav-item" style="background-color: transparent"><a
                onclick="basicInformation()">基本信息</a></li>
        <li id="ftxx" class="layui-nav-item" style="background-color: transparent"><a
                onclick="postInformation()">我要发帖</a></li>
        <li id="ftgl" class="layui-nav-item" style="background-color: transparent"><a
                onclick="postManagement()">发帖管理</a></li>
        <li class="layui-nav-item" style="background-color: transparent"><a href="/index"
                                                                            style="font-weight: bold">返回主页</a>
        </li>
    </ul>
    <%--请求返回json字符串，当返回为1时显示s1，返回为2时显示s2，以此类推...--%>
    <div class="s1">
        <form class="reigster_form layui-anim layui-anim-scale">
            <div class="rd">
                <p>
                    <span>昵称: </span><input id="nickname" value="" type="text" placeholder="请输入昵称" class="layui-input">
                </p>
                <p>
                    <span>选择性别: </span>
                    <select id="sex" name="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </p>
                <p style="display: inline">
                    <span>个人简介: </span><textarea id="userinfo" placeholder="请输入你的个人信息"
                                                 class="layui-textarea"></textarea>
                </p>
                <div class="btn">
                    <button id="register_btn" onclick="updateUuid()" class="layui-btn" type="button">修改</button>
                    <button id="reset_btn" type="button" class="layui-btn layui-btn-danger"
                            onclick="basicInformation()">重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="s2">
        <p style="margin:20px 0 20px 30px">
            <span style="margin-right: 30px">文章标题: </span><input style="width: 200px;display: inline-block"
                                                                 id="article_title" value="" type="text"
                                                                 placeholder="请输入标题" class="layui-input">
        </p>

        <p style="margin:20px 0 20px 30px;position:absolute;right: 30px;top: 0;display: inline-block">
            <span style="margin-right: 30px">文章简介: </span><input style="width: 200px;display: inline-block"
                                                                 id="article_target" value="" type="text"
                                                                 placeholder="请输入简介" class="layui-input">
        </p>

        <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea>
        <div class="btns1">
            <button style="width: 200px" id="article_post" <%--onclick="articlepost()"--%> class="layui-btn"
                    type="button">发布
            </button>
        </div>
    </div>
    <div class="s3">
        <table class="tb1" border="5">
            <tr class="tr1">
                <td>文章编号</td>
                <td>文章标题</td>
                <td>文章点赞</td>
                <td>文章状态</td>
                <td colspan="2">操作</td>
            </tr>
            <c:forEach items="${article}" var="item">
                <tr style="height: 40px">
                    <td>${item.articleUuid}</td>
                    <td>${item.articleTitle}</td>
                    <td>${item.articlePoints}</td>
                    <td>
                        <c:if test="${item.articleBan == 1}">封禁</c:if>
                        <c:if test="${item.articleBan == 0}">未封禁</c:if>
                    </td>
                    <td>
                        <button class="layui-btn" style="height: 20px;line-height: 20px"
                                onclick="article_update(${item.articleUuid})">修改
                        </button>
                    </td>
                    <td>
                        <button class="layui-btn layui-btn-danger" onclick="articleDelete(${item.articleUuid})"
                                style="height: 20px;line-height: 20px">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="s4">
        <p style="margin:20px 0 20px 30px">
            <span style="margin-right: 30px">文章标题: </span><input style="width: 200px;display: inline-block"
                                                                 id="article_titles" value="" type="text"
                                                                 placeholder="请输入标题" class="layui-input">
        </p>

        <p style="margin:20px 0 20px 30px;position:absolute;right: 30px;top: 0;display: inline-block">
            <span style="margin-right: 30px">文章简介: </span><input style="width: 200px;display: inline-block"
                                                                 id="article_targets" value="" type="text"
                                                                 placeholder="请输入简介" class="layui-input">
        </p>

        <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="contents">

        </textarea>
        <div class="btns1">
            <button style="width: 200px" id="article_posts" <%--onclick="articlepost()"--%> class="layui-btn"
                    type="button">发布
            </button>
        </div>
    </div>
</div>
<div class="gradient-pattern"></div>
</body>

<script>

    function articleDelete(uuid) {
        $.ajax({
            async: false,
            type: "POST",
            url: "/default/articleDelete",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            data: {
                "uuid": uuid
            },
            success: function (response) {
                if (response['flag']) {
                    location.reload();
                } else {
                    alert("删除失败，请联系管理员")
                }
            }
        })
    }

    function postManagement() {
        $('#jbxx>a').css({
            color: "rgba(255,255,255,.7)"
        })
        $('.s1').css({
            display: "none"
        })
        $('.s2').css({
            display: "none"
        })
        $('.s3').css({
            display: "block"
        })
        $('.s4').css({
            display: "none"
        })
    }


    $('.nav_btn').click(function () {
        $('.nav_btn_s').toggle();
    });

    $(function () {
        $.ajax({
            async: false,
            type: "POST",
            url: "/basicInformation",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var user = response['user'];
                $.each(user, function (index, obj) {
                    $('#nickname').val(obj['nickname']);
                    $('#sex').val(obj['sex']);
                    $('#userinfo').val(obj['userinfo']);
                });
                if (response['flag'] === 1) {
                    $('#jbxx>a').css({
                        color: "black"
                    })
                }
            },
            error: function () {
                alert("数据获取失败")
            }
        });
    });

    function postInformation() {
        $.ajax({
            async: false,
            type: "POST",
            url: "/postInformation",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response['flag'] === 2) {
                    $('#jbxx>a').css({
                        color: "rgba(255,255,255,.7)"
                    })
                    $('.s1').css({
                        display: "none"
                    })
                    $('.s2').css({
                        display: "block"
                    })
                    $('.s3').css({
                        display: "none"
                    })
                    $('.s4').css({
                        display: "none"
                    })
                }
            }
        });
    }

    function updateUuid() {
        $.ajax({
            async: false,
            type: "POST",
            url: "/basicInformation",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var user = response['user'];
                $.each(user, function (index, obj) {
                    $.ajax({
                        async: false,
                        type: "POST",
                        url: "/updateUuid",
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data: {
                            "nickname": $('#nickname').val(),
                            "sex": $('#sex').val(),
                            "userinfo": $('#userinfo').val(),
                        },
                        dataType: "json",
                        success: function (response) {
                            if (response['flag']) {
                                $('.ul_point>span').text("修改成功");
                                $('.ul_point').css({
                                    display: "block"
                                })
                                setTimeout(function () {
                                    $('.ul_point').css({
                                        display: "none"
                                    })
                                }, 1000);
                            } else {
                                $('.ul_point>span').text("修改失败");
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
                    });
                });
            },
            error: function () {
                alert("数据获取失败")
            }
        });
    }

    function basicInformation() {
        $('.s1').css({
            display: "block"
        })
        $('.s2').css({
            display: "none"
        })
        $('.s3').css({
            display: "none"
        })
        $('.s4').css({
            display: "none"
        })
        $.ajax({
            async: false,
            type: "POST",
            url: "/basicInformation",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var user = response['user'];
                $.each(user, function (index, obj) {
                    $('#nickname').val(obj['nickname']);
                    $('#sex').val(obj['sex']);
                    $('#userinfo').val(obj['userinfo']);
                });
                if (response['flag'] === 1) {
                    $('#jbxx>a').css({
                        color: "black"
                    })
                    $('#hyxx>a').css({
                        color: "rgba(255,255,255,.7)"
                    })
                }
            },
            error: function () {
                alert("数据获取失败")
            }
        });
    }


    /*    layui.use('layedit'), function () {
            var layedit = layui.layedit;
            layedit.build('contents');

            var index = layedit.build('contents', {
                tool: [
                    'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线
                    , '|' //分割线
                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'link' //超链接
                    , 'unlink' //清除链接
                    , 'code' //代码
                ],
                height: 380
            });

        };*/

    layui.use('layedit', function () {
        var layedit = layui.layedit;
        layedit.build('content'); //建立编辑器
        layedit.build('contents');

        var indexs = layedit.build('contents', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除线
                , '|' //分割线
                , 'left' //左对齐
                , 'center' //居中对齐
                , 'right' //右对齐
                , 'link' //超链接
                , 'unlink' //清除链接
                , 'code' //代码
            ],
            height: 380
        });

        var index = layedit.build('content', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除线
                , '|' //分割线
                , 'left' //左对齐
                , 'center' //居中对齐
                , 'right' //右对齐
                , 'link' //超链接
                , 'unlink' //清除链接
                , 'code' //代码
            ],
            height: 380
        });

        $('#article_post').click(function () {
                if ($('#article_title').val() === '') {
                    $('.ul_point>span').text("请补全标题");
                    $('.ul_point').css({
                        display: "block"
                    });
                    setTimeout(function () {
                        $('.ul_point').css({
                            display: "none"
                        })
                    }, 1000);
                } else {
                    if ($('#article_target').val() === '') {
                        $('.ul_point>span').text("请补全简介");
                        $('.ul_point').css({
                            display: "block"
                        });
                        setTimeout(function () {
                            $('.ul_point').css({
                                display: "none"
                            })
                        }, 1000);
                    } else {
                        if (layedit.getContent(index) === '') {
                            $('.ul_point>span').text("请补全内容");
                            $('.ul_point').css({
                                display: "block"
                            });
                            setTimeout(function () {
                                $('.ul_point').css({
                                    display: "none"
                                })
                            }, 1000);
                        } else {
                            $.ajax({
                                async: false,
                                type: "POST",
                                url: "/articlePost",
                                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                dataType: "json",
                                data: {
                                    "articleTitle": $('#article_title').val(),
                                    "articleTarget": $('#article_target').val(),
                                    "content": layedit.getContent(index)
                                },
                                success: function (response) {
                                    if (response['flag']) {
                                        $('.ul_point>span').text("上传成功");
                                        $('.ul_point').css({
                                            display: "block"
                                        });
                                        setTimeout(function () {
                                            $('.ul_point').css({
                                                display: "none"
                                            })
                                        }, 1000);
                                        location.reload();
                                    } else {
                                        $('.ul_point>span').text("上传失败");
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
                            });
                        }
                    }
                }
            }
        );
    });

    function article_update(id) {
        window.location.href = "/default/updateArticle/" + id;
    }

</script>

<style>
    .btn {
        margin: 20px 0 0 10px;
    }

    .btns1 {
        position: absolute;
        left: 50%;
        bottom: 20px;
        transform: translate(-50%);
    }

    .reigster_form {
        width: 70%;
        margin: 100px auto;
    }

    .reigster_form p {
        margin: 20px 0;
    }

    .nav_btn_s {
        display: inline-block;
    }

    .a1 {
        width: 1080px;
        height: 600px;
        margin: 0 auto;
        position: relative;
    }

    .layui-nav-tree .layui-nav-item a:hover {
        background-color: transparent;
    }

    .layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover {
        color: black;
    }

    #sex {
        width: 100px;
        line-height: 1.3;
        background-color: #fff;
        border-radius: 2px;
        color: gray;
        border: 1px solid gainsboro;
    }

    .layui-nav-tree .layui-nav-bar {
        background-color: #000000;
        border-radius: 20%;
    }

    .ul_point {
        z-index: 9999;
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

    .s1 {
        width: 920px;
        height: 600px;
        margin: 10px 0;
        float: right;
        box-shadow: 0 0 10px gray;
        position: relative;
        background-color: white;
    }

    .s2 {
        width: 920px;
        height: 600px;
        margin: 10px 0;
        float: right;
        box-shadow: 0 0 10px gray;
        position: relative;
        background-color: white;
        display: none;
    }

    .s3 {
        width: 920px;
        min-height: 600px;
        margin: 10px 0;
        float: right;
        box-shadow: 0 0 10px gray;
        position: relative;
        background-color: white;
        display: none;
    }

    .s4 {
        width: 920px;
        min-height: 600px;
        margin: 10px 0;
        float: right;
        background-color: white;
        box-shadow: 0 0 10px gray;
        position: relative;
        display: none;
    }

    .nav_btn {
        width: 36px;
        height: 36px;
        position: absolute;
        top: 75%;
        left: 50px;
        color: black;
        background: #dc673d;
        padding: 0;
        font-size: 20px;
        text-align: center;
        line-height: 36px;
        cursor: pointer;
        box-shadow: 0 0 10px gray;
        border-radius: 19px;
    }

    .nav_btn:hover {
        color: white;
        transition: .5s;
    }

    .layui-nav-item {
        cursor: pointer;
    }

    .layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover {
        background-color: transparent;
    }

    #content {
        width: 960px;
        margin: 0 auto 10px;
        background-color: red;
    }

    .tb1 {
        width: 80%;
        margin: 30px auto;
        text-align: center;
    }

    .tb1 tr td {
        margin: 20px;
    }

    .tr1 {
        border: 1px solid black;
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
