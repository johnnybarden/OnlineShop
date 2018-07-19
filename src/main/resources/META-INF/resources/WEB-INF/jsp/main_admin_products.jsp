<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="init.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%--<jsp:include page="add_product.jsp"></jsp:include>--%>

<section>
    <div class="container">
        <div class="row">
            <jsp:include page="admin_categories.jsp"></jsp:include>
            <div class="col-sm-9 padding-right">
                <%--<jsp:include page="add_product.jsp"></jsp:include>--%>
                <jsp:include page="product_table.jsp"></jsp:include>

                </body>
                </html>