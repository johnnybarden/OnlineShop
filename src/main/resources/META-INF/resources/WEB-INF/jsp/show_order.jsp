<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="formatDate" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="formatTime" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="init.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class = "container">
    <div>
        <p><b><spring:message code="label.user"/>:</b>    ${order.user.username}</p>
        <p><b><spring:message code="label.orderDate"/>:</b>    <formatDate:formatDate value = "${order.dateAndTime}" pattern = "dd.MM.yyyy"/></p>
        <p><b><spring:message code="label.orderTime"/>:</b>    <formatTime:formatDate value = "${order.dateAndTime}" pattern = "hh:mm"/></p>
        <p><b><spring:message code="label.status"/>:</b>    ${order.status}</p>
    </div>
    <table>
        <tr>
            <th><spring:message code="label.product"/></th>
            <th><spring:message code="label.quantity"/></th>
        </tr>
        <c:forEach var = "productInOrder" items = "${productsInOrder}">
            <tr>
                <td>${productInOrder.product.name}</td>
                <td>${productInOrder.quantity}</td>
            </tr>
        </c:forEach>
    </table>
</div>