<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet"
          href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <title>Products</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Register Car</h1>
        </div>
    </div>
</section>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Fill the form</h3>
                </div>
                <div class="panel-body">

                    <spring:url value="/registerCar" var="action"/>
                    <form:form modelAttribute="newCar" method="post" action="">
                        <security:csrfInput/>

                        <fieldset>
                            <div class="form-group">
                                Plate Number:
                                <form:input class="form:input-large" path="plateNo" type="text"/>
                                <form:errors class="alert alert-danger" path="plateNo"/>
                            </div>
                            <div class="form-group">
                                Manufacturer:
                                <form:input class=" form:input-large" path="manufacturer" type="text"/>
                                <form:errors class="alert alert-danger" path="manufacturer"/>
                            </div>
                            <div class="form-group">
                                Model:
                                <form:input class=" form:input-large" path="model" type="text"/>
                                <form:errors class="alert alert-danger" path="model"/>
                            </div>
                            <div class="form-group">
                                Year:
                                <form:input class=" form:input-large" path="makeYear" type="text"/>
                                <form:errors class="alert alert-danger" path="makeYear"/>
                            </div>
                            <div class="form-group">
                                Color:
                                <form:input class=" form:input-large" path="color" type="text"/>
                                <form:errors class="alert alert-danger" path="color"/>
                            </div>
                            <div class="form-group">
                                Number of Passengers:
                                <form:input class=" form:input-large" path="maxNoOfPassengers" type="text"/>
                                <form:errors class="alert alert-danger" path="maxNoOfPassengers"/>
                            </div>
                            <input class="btn btn-lg btn-success btn-mini" type="submit" value="Save">

                        </fieldset>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>