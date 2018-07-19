<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%--@elvariable id="products" type="java.util.List"--%>
<%--@elvariable id="TotalPrice" type=""--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>
    var totalPrice = 0;
</script>

<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#"><spring:message code="label.home"/></a></li>
                <li class="active"><spring:message code="label.cart"/></li>
            </ol>
        </div>
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image"><spring:message code="label.item"/></td>
                    <td class="description"></td>
                    <td class="price"><spring:message code="label.price"/></td>
                    <td class="quantity"><spring:message code="label.quantity"/></td>
                    <td class="total"><spring:message code="label.total"/></td>
                    <td></td>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${products.size() <= 0}">
                        <tr>
                            <td class="cart_description">
                                <h4><a href=""> <spring:message code="message.buy.error"/> </a></h4>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${products}" var="item">
                            <tr>
                                <td class="cart_product">
                                    <a href=""><img class="cart_img"
                                                    src="${pageContext.request.contextPath}/images/products/${item.product.imageLink}"
                                                    alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h4><a href="">${item.product.name}</a></h4>
                                    <p>Web ID: ${item.id}</p>
                                </td>
                                <td class="cart_price">
                                    <p>$${item.product.price}</p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href="/cart/${item.id}/inc"> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity"
                                               value=${item.quantity} size="2" readonly="readonly">
                                        <a href="/cart/   /decrement" class="cart_quantity_down"> - </a>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price" id="${item.id}">$</p>
                                    <script>
                                        var ele1 = ${item.quantity};
                                        var ele2 = ${item.product.price};
                                        totalPrice = totalPrice + ele1 * ele2;
                                        document.getElementById("${item.id}").innerHTML = ele1 * ele2;
                                    </script>
                                </td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="/cart/${item.id}/delete"><i
                                            class="fa fa-times"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
                <div>
                </div>
            </table>
            <div class="login-form">
                <form method="GET" action="${contextPath}/cart/payment" class="form-signin">

                    <div>
                        <h4><spring:message code="label.finalPrice"/>: <p id="p2"></p></h4>
                    </div>
                    <script>
                        document.getElementById("p2").innerHTML = totalPrice;
                    </script>
                    <c:choose>
                        <c:when test="${products.size() <= 0}">
                            <button class="btn btn-disabled" type="submit" disabled="disabled">Order</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-disabled" type="submit">Order</button>

                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
    </div>
</section>