<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="buy" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title><spring:message code="label.products"/></title>
</head>
<body>
    <jsp:include page="edit_product.jsp"/>
    <jsp:include page="main.jsp"/>
</body>
</html>