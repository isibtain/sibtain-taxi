<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Products</title>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h4>Register Driver</h4>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <spring:url value="/registerDriver" var="action"/>


            <form:form action="${action}" method="post" modelAttribute="newDriver">
            <security:csrfInput/><input type="hidden" name="_eventId" value="performDriverValidation">

            <fieldset>
                <legend>Driver License:</legend>
                <div class="form-group">
                    <label>License Number:</label><br/>
                    <form:input class="form-control" placeholder="License Number"
                                path="drivingLicenseNo" type="text"/>
                    <form:errors class="alert alert-danger" path="drivingLicenseNo"/>
                </div>
                <div class="form-group">
                    <label>License Expire Date:</label><br/>
                    <form:input class="form-control" path="drivingExpirationDate"
                                placeholder="mm-dd-yyyy" type="text"/>
                    <form:errors class="alert alert-danger" path="drivingExpirationDate"/>
                </div>
            </fieldset>
        </Div>
        <div class="col-md-6">

            <fieldset>
                <legend>Car Detail:</legend>
                <div class="form-group">
                    <label>Plate Number:</label><br/>
                    <form:input class="form-control" path="car.plateNo" type="text"/>
                    <form:errors class="alert alert-danger" path="car.plateNo"/>
                </div>
                <div class="form-group">
                    <label>Manufacturer:</label><br/>
                    <form:input class="form-control" path="car.manufacturer" type="text"/>
                    <form:errors class="alert alert-danger" path="car.manufacturer"/>
                </div>

                <div class="form-group">
                    <label>Model:</label><br/>
                    <form:input class="form-control" path="car.model" type="text"/>
                    <form:errors class="alert alert-danger" path="car.model"/>
                </div>
                <div class="form-group">
                    <label>Year:</label><br/>
                    <form:input class="form-control" path="car.makeYear" type="text"/>
                    <form:errors class="alert alert-danger" path="car.makeYear"/>
                </div>
                <div class="form-group">
                    <label>Color:</label><br/>
                    <form:input class="form-control" path="car.color" type="text"/>
                    <form:errors class="alert alert-danger" path="car.color"/>
                </div>
                <div class="form-group">
                    <label>Number of Passengers:</label><br/>
                    <form:input class="form-control" path="car.maxNoOfPassengers" type="text"/>
                    <form:errors class="alert alert-danger" path="car.maxNoOfPassengers"/>
                </div>

                <input class="btn btn-lg btn-success btn-mini" type="submit" value="Save">


            </fieldset>

            </form:form>


        </div>
    </div>

</div>
</body>