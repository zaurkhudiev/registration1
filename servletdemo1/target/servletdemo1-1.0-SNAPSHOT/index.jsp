<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <title> ADA Dashboard</title>
</head>

<body>
<c:set scope = "request" value="WELCOME" var="pageTitle"/>
<c:out value = "${pageTitle}"/>

<c:if test="${sessionScope.is_authorize != null}">
    <div>
    Hello, ${sessionScope.current_username}
        <div style=float:top;>
        <h1>Please enter your data...</h1>
        <form action="<%= request.getContextPath()%>/dash" method="post">
            <div>
                <input type="text" name="firstname" placeholder="FIRSTNAME..."/>
            </div>
            <div>
                <input type="text" name="lastname" placeholder="LASTNAME..."/>
            </div>
            <div>
                <input type="text" name="city" placeholder="CITY..."/>
            </div>
            <div>
                <input type="text" name="country" placeholder="COUNTRY..."/>
            </div>
            <div>
                <input type="text" name="gender" placeholder="GENDER..."/>
            </div>
            <div>
                <input type="submit" value="submit">
            </div>
        </form>
    </div>
    </div>
    <div style="float: right">
        <a href="/helloworld/auth?action=logout">Logout</a>

    </div>
    <div>
        <a href="/helloworld/details.jsp"> Click for Your Data </a>
    </div>
    <div>
        <a href="/helloworld/auth.jsp"> REGISTRATION PAGE </a>
    </div>
</c:if>
<c:if test="${sessionScope.is_authorize != null}">
</c:if>

<c:if test="${sessionScope.is_authorize ==null}">
    <c:import url="auth.jsp"></c:import>

</c:if>
</body>
</html>