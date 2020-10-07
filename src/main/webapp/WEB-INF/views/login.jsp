<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>

<style>
    .panel-default{
        width: 379px;
        margin: 0 auto;
        padding: 20px;
    }

</style>
    <div class="container">
    <div class="jumbotron">
            <h1>Welcome back!!</h1> <%--<spring:message code="${login.mainLine}"/>--%>
        </div>
    </div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please sign in</h3><%--<spring:message code="${login.pleaseSignin}"/>--%>
                </div>
                <div class="panel-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                                <%--                            <spring:message--%>
                                <%--                                    code="login.badCredentials"/>--%>
                            Incorrect username or password.
                            <br/>
                        </div>
                    </c:if>

                    <spring:url value="/postlogin" var="action" />

                    <form action="${action}" method="post">
                        <%--                    <div class="alert alert-danger">--%>
                        <%--                        <form code="login.badCredentials" path="*">Incorrect username or password.</form>--%>
                        <%--                    </div>--%>
                        <security:csrfInput/>
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="User Name"
                                       id="username" name="username" type="text"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password"
                                       id="password" name="password" type="password"/>
                            </div>
                            <input class="btn btn-lg btn-success btn-mini" type="submit"
                                   value="Login">
                            <a href="<spring:url value="/users/signup" />"><input
                                    class="btn btn-lg btn-success btn-mini" type="button"
                                    value="Not a member? Sign up!"></a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>