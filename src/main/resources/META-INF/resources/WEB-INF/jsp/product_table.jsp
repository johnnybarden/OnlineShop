<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="blocking" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="editing" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="deleting" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="add" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="product" type=""--%>

<div class = "container">
    <div class = "login-form">
        <add:form action = "/products/add" method="get">
            <h3 class = "navbar-header"><spring:message code="label.products"/></h3>
            <button style="margin-left: 40px;" class="btn btn-default" type = "submit"><spring:message code="label.addProduct"/></button>
        </add:form>
    </div>
    <table class = "table table-condensed">
        <tr>
            <th><spring:message code="label.image"/></th>
            <th><spring:message code="label.name"/></th>
            <th><spring:message code="label.price"/></th>
            <th><spring:message code="label.edit"/></th>
        </tr>
        <c:forEach var = "product" items = "${productList}">
                <tr>
                    <td><img style = "height: 40px;" src = "${pageContext.request.contextPath}/images/products/${product.imageLink}"></td>
                    <td>"${product.name}"</td>
                    <td>"${product.price}"</td>
                    <td>
                        <div class = "login-form">
                            <editing:form action = "${pageContext.request.contextPath}/products/${product.id}/edit" method = "get">
                                <button type="submit" class="btn btn-default"><spring:message code="label.edit"/></button>
                            </editing:form>
                        </div>
                    </td>
                </tr>
        </c:forEach>
    </table>
</div>