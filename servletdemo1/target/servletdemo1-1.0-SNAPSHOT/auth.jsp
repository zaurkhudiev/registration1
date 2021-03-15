
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 3/15/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to our website!</title>
</head>
<body>

<div style=float:top;>
    <h1>User Register</h1>
    <form action="<%= request.getContextPath()%>/register" method="post">
        <div>
            <input type="text" name="email"/>
        </div>
        <div>
            <input type="password" name="password"/>
        </div>

        <div>
            <input type="submit" value="submit">
        </div>
    </form>
</div>
<div>
    <a href="/helloworld/login.jsp"> LOGIN PAGE </a>
</div>
</body>
</html>
