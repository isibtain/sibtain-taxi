<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <c:set var="title">
        <tiles:getAsString name="title"/>
    </c:set>
    <title><spring:message code="${title}"/></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


    <style type="text/css">
        .welcome {
            padding: 7px 10px 0 10px;
            text-align: left;
            float: left;
            color: #fff;
            /*background: #19899b !important;*/
            margin-right: 10px;
            border-radius: 10px;
        }

        .logout{
            background: #19899b !important;
        }

        .footer{
            margin: 20px 0;
            border-top: 1px dashed #ccc;
        }

        .footer p{
            margin: 20px 0;

        }
    </style>

</head>

<body>

<div class="container">

    <div class="bs-example">
        <nav class="navbar navbar-expand-md navbar-light bg-info">
            <a href="#" class="navbar-brand">Bon Voyage</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <tiles:insertAttribute name="navigation"/>
                </div>
                <div class="navbar-nav ml-auto">
                    <security:authorize access="isAnonymous()">
                        <a href="<spring:url value="/login" />">
                            <button type="button" class="btn btn-info">
                                SIGN IN / JOIN US!
                            </button>
                        </a>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
                        <span class="welcome">Welcome, <security:authentication property="principal.username"/>!</span>
                        <a href="<spring:url value="/dologout" />" class="btn btn-info logout">
                            LOG OUT
                        </a>
                    </security:authorize>
                </div>
                <%--				<div class="navbar-nav ml-auto">--%>
                <%--					<a href="<spring:url value="/login/" />">--%>
                <%--						<button type="button" class="btn btn-info">--%>
                <%--							SIGN OUT--%>
                <%--						</button>--%>
                <%--					</a>--%>
                <%--				</div>--%>

            </div>
        </nav>
    </div>


    <div class="row">
        <tiles:insertAttribute name="body"/>
    </div>

    <div class="footer">
        <tiles:insertAttribute name="footer"/>
    </div>

</div>
</body>
</html>