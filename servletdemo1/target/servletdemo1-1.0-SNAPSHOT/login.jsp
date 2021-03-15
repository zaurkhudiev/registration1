<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 3/13/2021
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    div.error_message > b{
        color: red;
        font-style: italic;
    }
</style>



<div class="center">
    <h1>Auth Page</h1>
    <p>Please login to proceed...</p>
    <%--    <c:if test="${error_message} !=null">--%>

    <%--    <div class="error_message">--%>
    <%--        <c:forEach items="${error_message}" var="${err}"--%>
    <%--        <b><c:out value="${err}"/></b>--%>

    <%--    </div>--%>
    <%--    </c:if>--%>


    <form action="/helloworld/auth" method="POST">
        <div>
            <label for="fusername">Email: </label>
            <input id="fusername" type="text" name="email" placeholder="email..."/>
        </div>
        <div>
            <label for="fpassword">Password: </label>
            <input id="fpassword" type="password" name="password" placeholder="password"/>
        </div>
        <div style="clear:both;"></div>
        <input type="submit" name="dosubmit" value="submit"/>

    </form>

    <div>
        <a href="/helloworld/auth.jsp"> REGISTRATION PAGE </a>
    </div>
    </form>
</div>
</div>