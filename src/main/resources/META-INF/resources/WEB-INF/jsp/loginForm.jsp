<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-1">
            <div class="login-form"><!--login form-->
                <h2><spring:message code="label.loginToAcc"/></h2>
                <form method="POST" action="${contextPath}/login" class="form-signin">
                    <div class="form-group ${error != null ? 'has-error' : ''}">

                        <span class="message-success">${message}</span>
                        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'blocked'}">
                            <span class="message-error"><spring:message code="message.blocked.error"/></span>
                        </c:if>
                        <input name="username" type="text" class="form-control" placeholder="Username"/>
                        <input name="password" type="password" class="form-control" placeholder="Password"/>
                        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message != 'blocked'}">
                            <span class="message-error">${error}</span>
                        </c:if>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn btn-default" type="submit"><spring:message code="label.login"/></button>
                        <h4 class="text-center"><a href="${contextPath}/registration"><spring:message code="label.createAccount"/></a></h4>
                    </div>

                </form>
            </div><!--/login form-->
        </div>
        <div class="col-sm-1">
            <%--<h2 class="or">OR</h2>--%>
        </div>
    </div>
</div>
