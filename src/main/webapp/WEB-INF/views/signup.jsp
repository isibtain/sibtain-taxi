<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
    .alert-danger {
        display: block;
        margin-top: 10px;
        padding: 5px 10px;
        font-size: 14px;
    }
</style>
<div class="container">
    <div class="jumbotron">
        <h1><spring:message code="signup.mainLine"/></h1>
    </div>
</div>
<div class="container">
    <div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><spring:message code="signup.pleaseSignin"/></h3>
                </div>
                <div class="panel-body">
                    <spring:url value="/users/signup" var="action"/>
                    <%--@elvariable id="newUser" type="com.bonvoyage.domain.User"--%>
                    <form:form action="${action}" method="post" modelAttribute="newUser">
                        <fieldset>
                            <table>
                                <tr>
                                    <td class="form-group" width="150px" valign="top">
                                        <label for="firstName"><spring:message code="firstName"/>:</label>
                                    </td>
                                    <td width="80%">
                                        <form:input class="form:input-large" id="firstName" path="firstName"
                                                    type="text"/>
                                        <br/><form:errors class="alert alert-danger" path="firstName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="lastName"><spring:message code="lastName"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="lastname" path="lastName"/>
                                        <br/><form:errors class="alert alert-danger" path="lastName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="birthdate"><spring:message code="birthdate"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="birthdate" path="birthdate"
                                                    type="date"/>
                                        <br/><form:errors class="alert alert-danger" path="birthdate"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="email"><spring:message code="email"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="email" path="email"/>
                                        <br/><form:errors class="alert alert-danger" path="email"/>
                                    </td>
                                </tr>
<%--                                <tr>--%>
<%--                                    <td class="form-group" valign="top">--%>
<%--                                        <label for="photo">Photo:</label>--%>
<%--                                    </td>--%>
<%--                                    <td class="form-group" valign="top">--%>
<%--                                        <form:input type="button" value="Upload my photo" class=" form:input-large" id="photo" path="photo"/>--%>
<%--                                        <br/><form:errors class="alert alert-danger" path="photo"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label><spring:message code="phoneNo"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="area" path="phoneNo.area"/>-
                                        <form:input class=" form:input-large" id="prefix" path="phoneNo.prefix"/>-
                                        <form:input class=" form:input-large" id="number" path="phoneNo.number"/>
                                        <br/><form:errors class="alert alert-danger" path="phoneNo.area"/>
                                        <br/><form:errors class="alert alert-danger" path="phoneNo.prefix"/>
                                        <br/><form:errors class="alert alert-danger" path="phoneNo.number"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label><spring:message code="address"/>:</label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="address.door"><spring:message code="address.door"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="door" path="address.door"/>
                                        <br/><form:errors class="alert alert-danger" path="address.door"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="address.street"><spring:message code="address.street"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="street" path="address.street"/>
                                        <br/><form:errors class="alert alert-danger" path="address.street"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="address.city"><spring:message code="address.city"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="city" path="address.city"/>
                                        <br/><form:errors class="alert alert-danger" path="address.city"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="address.state"><spring:message code="address.state"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="state" path="address.state"/>
                                        <br/><form:errors class="alert alert-danger" path="address.state"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label><spring:message code="address.zipCode"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="state"
                                                    path="address.zipCode.basicCode"/>-
                                        <form:input class=" form:input-large" id="state"
                                                    path="address.zipCode.plusFour"/>
                                        <br/><form:errors class="alert alert-danger" path="address.zipCode.basicCode"/>
                                        <br/><form:errors class="alert alert-danger" path="address.zipCode.plusFour"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label><spring:message code="idDocument"/>:</label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="idDocument.documentType"><spring:message code="idDocument.documentType"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:select class=" form:input-large" path="idDocument.documentType" id="idDocumentType">
                                            <option value="STATE_ID"><spring:message code="idDocument.documentType.stateID"/></option>
                                            <option value="DRIVER_LICENSE_OR_PERMIT"><spring:message code="idDocument.documentType.dl"/></option>
                                            <option value="PASSPORT"><spring:message code="idDocument.documentType.passport"/></option>
                                            <option value="SSN"><spring:message code="idDocument.documentType.ssn"/></option>
                                        </form:select>
                                        <br/><form:errors class="alert alert-danger" path="idDocument.documentType"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="idDocument.documentNo"><spring:message code="idDocument.documentNo"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="idDocumentNo" path="idDocument.documentNo"/>
                                        <br/><form:errors class="alert alert-danger" path="idDocument.documentNo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="idDocument.validThrough"><spring:message code="idDocument.validThrough"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="validThrough" path="idDocument.validThrough" type="date"/>
                                        <br/><form:errors class="alert alert-danger" path="idDocument.validThrough"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="username"><spring:message code="username"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="username" path="username"/>
                                        <br/><form:errors class="alert alert-danger" path="username"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-group" valign="top">
                                        <label for="prePassword"><spring:message code="prePassword"/>:</label>
                                    </td>
                                    <td class="form-group" valign="top">
                                        <form:input class=" form:input-large" id="prePassword" path="prePassword"
                                                    type="password"/>
                                        <br/><form:errors class="alert alert-danger" path="prePassword"/>
                                    </td>
                                </tr>
                            </table>
                            <form:button class="btn btn-lg btn-success btn-mini"
                                         type="submit"><spring:message code="Button.signup"/></form:button>
                        </fieldset>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>