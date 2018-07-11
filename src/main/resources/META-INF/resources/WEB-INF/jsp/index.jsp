<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
</head>
<body>

<jsp:include page="main.jsp"></jsp:include>

<div align="center">
    <%--@elvariable id="userJSP" type=""--%>
    <form:form action="login"  modelAttribute="userJSP">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Welcome</h2></td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td><form:input path="username"/></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:password path="password"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Sign in"/></td>

            </tr>
        </table>
    </form:form>
    <form:form action="registration" method="post">

        <td colspan="2" align="center"><input type="submit" value="Sign up"/></td>

    </form:form>
</div>
</body>
</html>