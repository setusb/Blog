<%--
  User: setusb
  Date: 2021/4/21
  Time: 16:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../../../resources/layui/css/layui.css" rel="stylesheet" type="text/css">
<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="//unpkg.com/layui@2.6.4/dist/layui.js"></script>
<html>
<head>
    <title>吊毛猫之家 - 文章浏览</title>
</head>
<body>
<div class="gradient-pattern"></div>
<div class="div_1">
    <h1>${article.articleTitle}</h1>
    <div class="div_2">
        ${article.articleContent}
    </div>
    <div class="div_3">
        <button id="butslike" class="layui-btn layui-btn-primary layui-border-black"
                onclick="like(${article.articleUuid})">点赞数: ${article.articlePoints}</button>
        <button class="layui-btn layui-btn-normal" onclick="back()">返回主页</button>
    </div>
</div>
<%@include file="../index/footer.jsp" %>
</body>
<script>
    function back() {
        window.location.href = "/index";
    }

    function like(uuid) {
        $.ajax({
            type: "POST",
            url: "/likePlusOne",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                "uuid": uuid
            },
            dataType: "json",
            success: function (response) {
                $('#butslike').text("点赞数: " + response['flag']);
            },
            error: function () {
                alert("数据获取失败")
            }
        })
    }
</script>
<style>
    .div_1 {
        width: 1080px;
        min-height: 600px;
        margin: 10px auto;
        padding-bottom: 40px;
        box-shadow: 0 0 10px gray;
        position: relative;
        background-color: white;
    }

    .div_1 h1 {
        text-align: center;
    }

    .div_2 {
        padding: 15px;
        width: 960px;
        margin: 30px auto;
        border-radius: 8px;
        min-height: 200px;
        background-color: #eeeeee;
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

    .div_3 {
        position: absolute;
        bottom: 20px;
        left: 50%;
        transform: translate(-50%);
    }
</style>
</html>
