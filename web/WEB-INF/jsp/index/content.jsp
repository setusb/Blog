<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: setusb
  Date: 2021/4/21
  Time: 12:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="content_ul">
    <c:forEach items="${article}" var="item">
        <li>
            <a href="/article/${item.articleUuid}">${item.articleTitle}</a>
            <p>${item.articleTarget}</p>
        </li>
    </c:forEach>
</ul>
