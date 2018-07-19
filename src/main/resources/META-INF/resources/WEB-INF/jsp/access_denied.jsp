<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="init.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class = "container">
    <div class = "content-404">
        <h1>403</h1>
        <h2><spring:message code="label.accessDenied"/></h2>
    </div>
</div>