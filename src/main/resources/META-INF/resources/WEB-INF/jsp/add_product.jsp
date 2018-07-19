<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="buy" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="addproduct" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="init.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<%--@elvariable id="product" type=""--%>

<div class="container">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-1">
            <div class="login-form"><!--/form for adding a product-->
                <h2><spring:message code="label.addProduct"/></h2>
                <!--<form action="catalog">-->
                <addproduct:form action = "${pageContext.request.contextPath}/products" method = "post" enctype="multipart/form-data" modelAttribute = "product" class="form_signin form_register" id="jform" name = "form_register">
                        <input type="file" class="btn btn-default" name="file" id="upload_hidden" style="position: absolute; display: block; overflow: hidden; width: 0; height: 0; border: 0; padding: 0;"
                               onchange="document.getElementById('upload_visible').value = this.value;" >
                        <input type="text" readonly="1" id="upload_visible"
                               onclick="document.getElementById('upload_hidden').click();" placeholder="Click here to upload image" />
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <addproduct:input type = "text" path = "name" name="product_name" id="product_name" minLength="2" maxlength="32" class="form-control product_form_margin" placeholder="Product name" required="true" oninput="validate()"/>
                        <span id="productNameInfo" class="form_hint" style="background: #46b8da"><spring:message code="label.enterProdName"/></span>
                        <form:errors path="name"/>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <addproduct:input type="number" class = "product-price product_form_margin" path = "price" name="product_price" id="product_price" min="1" max="9999999" placeholder="Price" required="true" oninput="validate()"/>
                            <span id="productPriceInfo" class="form_hint" style="background: #46b8da"><spring:message code="label.enterProdPrice"/></span>
                            <form:errors path="price"/>
                        <button type="submit" class="btn btn-default"><spring:message code="label.addProduct"/></button>
                            <addproduct:select path = "category" cssStyle = "width: 250px;">
                                <addproduct:option value = "STAR_TREK"></addproduct:option>
                                <addproduct:option value = "STAR_WARS"></addproduct:option>
                                <addproduct:option value = "WARHAMMER_40000"></addproduct:option>
                                <addproduct:option value = "START_CITIZEN"></addproduct:option>
                                <addproduct:option value = "EVE_ONLINE"></addproduct:option>
                                <addproduct:option value = "ELITE_DANGEROUS"></addproduct:option>
                            </addproduct:select>
                        <button type="submit" class="btn btn-default">Add product</button>
                    </addproduct:form>
            </div>

        </div>
    </div>
</div>

        <script>
var jVal;
            function validate(){
                jVal = {
                    'productName' : function() {
                        $('body').append('');
                        var productNameInfo = $('#productNameInfo');
                        var ele = $('#product_name');
                        if((ele.val().length < 2)||(ele.val().length > 32)) {
                            jVal.errorProductName = true;
                            productNameInfo.removeClass('hint_green').addClass('hint_red').html('must be 2 - 32 characters').show();
                        } else {
                            jVal.errorProductName = false;
                            productNameInfo.removeClass('hint_red').addClass('hint_green').html('correct').show();
                        }
                    },
                    'productPrice' : function() {
                        $('body').append('<div id="productPriceInfo" class="info"></div>');
                        var productPriceInfo = $('#productPriceInfo');
                        var ele = $('#product_price');
                        if(!((ele.val().length <= 7)&&(ele.val().length > 0)&&(parseInt(ele.val())>=1))) {
                            jVal.errorPrice = true;
                            productPriceInfo.removeClass('hint_green').addClass('hint_red').html('must be 1 - 7 positive digits').show();
                        } else {
                            jVal.errorPrice = false;
                            productPriceInfo.removeClass('hint_red').addClass('hint_green').html('correct').show();
                        }
                    },
                    'sendIt' : function (){
                        if((!jVal.errorProductName)&&(!jVal.errorPrice)) {
                            $('#jform').submit();
                        }
                    }
                };
// ====================================================== //
                $('#send').click(function (){
                    var obj = $.browser.webkit ? $('body') : $('html');
                    obj.animate({ scrollTop: $('#jform').offset().top }, 750, function (){
                        jVal.errorProductName = true;
                        jVal.errorPrice = true;
                        jVal.productName();
                        jVal.productPrice();
                        jVal.sendIt();
                    });
                    return false;
                });


                $('#product_name').change(jVal.productName);
                $('#product_price').change(jVal.productPrice);
            };

            document.getElementById("product_name").addEventListener('keyup', validateName);
            document.getElementById("product_price").addEventListener('keyup', validatePrice);
            function validateName() {
                jVal.productName();
            }
            function validatePrice() {
                jVal.productPrice();
            }

        </script>
    </div>
</div>