<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="init.jsp"/>
<jsp:include page="header.jsp"/>
<section>
    <div class="container">
        <div class="row">
            <jsp:include page="categories.jsp"/>
            <div class="col-sm-9 padding-right">
                <jsp:include page="products.jsp"/>



