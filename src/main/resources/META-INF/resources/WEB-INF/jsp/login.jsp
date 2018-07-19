<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="init.jsp"/>
<jsp:include page="header.jsp"/>
<section>
    <div>
        <sec:authorize access="isAnonymous()">
            <jsp:include page="loginForm.jsp"/>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h3>You've already log in</h3>
                        </div>
                    </div>
                </div>
            </div>
        </sec:authorize>
    </div>
</section>
</body>
</html>
