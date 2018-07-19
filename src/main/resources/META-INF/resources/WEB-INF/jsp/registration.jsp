<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en"><jsp:include page="init.jsp"/>
<jsp:include page="header.jsp"/>
<section>
    <div>
        <jsp:include page="registrationForm.jsp"/>
    </div>
</section>
</body>
</html>
</html>
