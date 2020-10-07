<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--
  Created by IntelliJ IDEA.
  User: Aser Ahmad
  email: aaahmad@mum.edu
  Date: 11/19/2019
  Time: 10:40 PM
  This page shows user details after a successful signup.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Congratulations! You are now a member of our community!</h1>
        </div>
    </div>
</section>
<div class="container">
    <div>
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title">Here are your membership data:</h5>
                </div>
                <div class="btn btn-info logout">
                    <h3>
                        <label id="name">Name: ${savedUser.firstName} ${savedUser.lastName}</label>
                    </h3>
                    <h3>
                        <label id="savedUser.username">Username: ${savedUser.username}</label>
                    </h3>
                </div>
                <div class="panel-heading">
                    <h5 class="panel-title">Please wait until an admin approves your membership request.</h5><%--<spring:message code="${login.pleaseSignin}"/>--%>
                </div>
            </div>
        </div>
    </div>
</div>