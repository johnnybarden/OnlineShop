<%--
  Created by IntelliJ IDEA.
  User: goponenko
  Date: 07.07.2018
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Online Shop</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
            </ul>
        </div>
    </div>
</nav>

<div align="center">
    <%--@elvariable id="userJSP" type=""--%>
    <%--@elvariable id="message" type=""--%>
    <form:form action="login"  modelAttribute="userJSP">


        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Welcome</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><h3>${message} </h3></td>
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

    <form:form action="registration" method="get">

        <td colspan="2" align="center"><input type="submit" value="Sign up"/></td>

    </form:form>
</div>
</body>
</html>