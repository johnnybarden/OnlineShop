<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="userJSP" type=""--%>
<jsp:include page="init.jsp"/>
<jsp:include page="header.jsp"/>
<section>

    <div class="container">
        <div class="col-sm-4 col-sm-offset-1">

            <h2><spring:message code="label.editProfile"/>!</h2>
            <form:form method="POST" action="edit" modelAttribute="userJSP" class="form-signin form_register" id="jform" name = "form_register">
                <spring:bind path="firstName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="firstName" name="firstName" id="firstName" minLength="1" maxlength="32" class="form-control form_margin" placeholder="First name"
                                    autofocus="true" required="true" oninput="validate()"/> <span id="firstNameInfo" class="form_hint" style="background: #46b8da" ><spring:message code="label.enterName"/></span>
                        <form:errors path="firstName"/>
                    </div>
                </spring:bind>
                <spring:bind path="secondName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="secondName" name="secondName" id="secondName" minLength="1" maxlength="32" class="form-control form_margin" placeholder="Second name"
                                    autofocus="true" required="true" oninput="validate()"/> <span id="secondNameInfo" class="form_hint" style="background: #46b8da" ><spring:message code="label.enterSurname"/></span>
                        <form:errors path="secondName"/>
                    </div>
                </spring:bind>
                <spring:bind path="phoneNumber">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="phoneNumber" name="phoneNumber" id="phoneNumber" minLength="8" maxlength="32" class="form-control form_margin" placeholder="Phone number"
                                    autofocus="true" required="true" oninput="validate()"/> <span id="phoneNumberInfo" class="form_hint" style="background: #46b8da" ><spring:message code="label.enterPhone"/></span>
                        <form:errors path="phoneNumber"/>
                    </div>
                </spring:bind>
                <spring:bind path="address">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="address" name="address" id="address" minLength="10" class="form-control form_margin" placeholder="Address"
                                    autofocus="true" required="true" oninput="validate()"/> <span id="addressInfo" class="form_hint" style="background: #46b8da" ><spring:message code="label.enterAddress"/></span>
                        <form:errors path="address"/>
                    </div>
                </spring:bind>
                <button class="btn btn-default" type="submit" id="send"><spring:message code="label.submit"/></button>
                <form:form method="GET" action="/profile">
                    <button class="btn btn-default" type="submit"><spring:message code="label.cancel"/></button>

                </form:form>
            </form:form>
        </div>
        <div class="col-sm-1">
        </div>
        <div class="signup-form"><!--sign up form-->

        </div><!--/sign up form-->
    </div>


    <script>
        var jVal;
        function validate(){
            jVal = {
                'firstName' : function() {
                    $('body').append('<div id="firstNameInfo" class="info"></div>');
                    var aboutInfo = $('#firstNameInfo');
                    var ele = $('#firstName');
                    if(ele.val().length < 1) {
                        jVal.errorFirstName = true;
                        aboutInfo.removeClass('hint_green').addClass('hint_red').html('at least 1 characters').show();
                    } else {
                        jVal.errorFirstName = false;
                        aboutInfo.removeClass('hint_red').addClass('hint_green').html('First name correct').show();
                    }
                },
                'secondName' : function() {
                    $('body').append('<div id="firstNameInfo" class="info"></div>');
                    var aboutInfo = $('#secondNameInfo');
                    var ele = $('#secondName');
                    if(ele.val().length < 1) {
                        jVal.errorSecondName = true;
                        aboutInfo.removeClass('hint_green').addClass('hint_red').html('at least 1 characters').show();
                    } else {
                        jVal.errorSecondName = false;
                        aboutInfo.removeClass('hint_red').addClass('hint_green').html('Second name correct').show();
                    }
                },
                'address' : function() {
                    $('body').append('<div id="addressInfo" class="info"></div>');
                    var aboutInfo = $('#addressInfo');
                    var ele = $('#address');
                    if(ele.val().length < 10) {
                        jVal.errorAddress = true;
                        aboutInfo.removeClass('hint_green').addClass('hint_red').html('at least 10 characters').show();
                    } else {
                        jVal.errorAddress = false;
                        aboutInfo.removeClass('hint_red').addClass('hint_green').html('Address correct').show();
                    }
                },
                'phoneNumber' : function() {
                    $('body').append('<div id="phoneNumberInfo" class="info"></div>');
                    var aboutInfo = $('#phoneNumberInfo');
                    var ele = $('#phoneNumber');
                    var regex = /^[\+]?[0-9][-\s]?[(]?[0-9]{3}[)]?[-\s]?[0-9]{3}[-\s]?[0-9]{2}[-\s]?[0-9]{2,6}$/;
                    if(!regex.test(ele.val())) {
                        jVal.errorPhoneNumber = true;
                        aboutInfo.removeClass('hint_green').addClass('hint_red').html('\'Example format: +7-999-000-00-00\'').show();
                    } else {
                        jVal.errorPhoneNumber = false;
                        aboutInfo.removeClass('hint_red').addClass('hint_green').html('Phone number correct').show();
                    }
                },
                'sendIt' : function (){
                    if((!jVal.errorAddress)&&(!jVal.errorSecondName)&&
                        (!jVal.errorFirstName)&&(!jVal.errorPhoneNumber)&&(!jVal.errorSecondName)) {
                        $('#jform').submit();
                    }
                }
            };
// ====================================================== //
            $('#send').click(function (){
                var obj = $.browser.webkit ? $('body') : $('html');
                obj.animate({ scrollTop: $('#jform').offset().top }, 750, function (){
                    jVal.errorAddress = true;
                    jVal.errorFirstName = true;
                    jVal.errorSecondName = true;
                    jVal.errorPhoneNumber = true;
                    jVal.address();
                    jVal.firstName()
                    jVal.secondName();
                    jVal.phoneNumber();
                    jVal.sendIt();
                });
                return false;
            });
            $('#address').change(jVal.address);
            $('#firstName').change(jVal.firstName);
            $('#secondName').change(jVal.secondName);
            $('#phoneNumber').change(jVal.phoneNumber);
        };

        document.getElementById("address").addEventListener('keyup', validateAddress);
        document.getElementById("firstName").addEventListener('keyup', validateFirstName);
        document.getElementById("secondName").addEventListener('keyup', validateSecondName);
        document.getElementById("phoneNumber").addEventListener('keyup', validatePhoneNumber);

        function validateAddress() {
            jVal.address();
        }
        function validateFirstName() {
            jVal.firstName();
        }
        function validateSecondName() {
            jVal.secondName();
        }
        function validatePhoneNumber() {
            jVal.phoneNumber();
        }
    </script>
</section>
