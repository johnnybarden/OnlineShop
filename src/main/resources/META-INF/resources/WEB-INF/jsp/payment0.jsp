<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%--@elvariable id="message" type=""--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="init.jsp"/>
<jsp:include page="header.jsp"/>
<section>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2><spring:message code="label.paymentInfo"/></h2>
                        <form method="POST" action="${pageContext.request.contextPath}/cart/order" class="form-signin">
                            <span class="message-success">${message}</span>
                            <%--@elvariable id="isPaid" type=""--%>
                            <c:choose>
                                <c:when test="${isPaid == false}">
                                    <button class="btn btn-default" type="submit"><spring:message code="label.pay"/></button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-disabled" type="submit" disabled="disabled"><spring:message code="label.pay"/></button>
                                </c:otherwise>
                            </c:choose>
                            <h4 class="text-left"><a href="${pageContext.request.contextPath}/cart"><spring:message code="label.backToCart"/></a></h4>
                        </form>0

                    </div><!--/login form-->
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>