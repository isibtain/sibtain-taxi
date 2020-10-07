<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet"
          href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

</head>

<body>

<section>
    <div class="container">

        <form:form modelAttribute="review" method="post" class="form-inline">
            <form:errors path="*" cssClass="text-danger"/>
            <div class="form-group">
                <form:input class="form-control" path="tripId" type="number" placeholder="tripId"/>
                <form:errors path="tripId" cssClass="text-danger"/>
            </div>

            <div class="form-group">
                <form:input class="form-control" path="userFromId" type="number" placeholder="userFromId"/>
                <form:errors path="userFromId" cssClass="text-danger"/>
            </div>

            <div class="form-group">
                <form:input class="form-control" path="userToId" type="number" placeholder="userToId"/>
                <form:errors path="userToId" cssClass="text-danger"/>
            </div>


            <div class="form-group">
                <form:input class="form-control" path="comment" type="text" placeholder="comment"/>
                <form:errors path="comment" cssClass="text-danger"/>
            </div>

            <div class="form-group">
                <form:input class="form-control" path="rating" type="number" placeholder="rating"/>
                <form:errors path="rating" cssClass="text-danger"/>
            </div>


            <div class="form-group">
               <input type="submit" value="Submit" />
            </div>

        </form:form>
        <%--                            style="width:250px;"/>
        </form:form>
        <%--        <form:form modelAttribute="review" method="post" class="form-inline">--%>

        <%--            <div class="form-group mb-2">--%>
        <%--                <form:input class="form-control" path="tripId" id="origin-input" type="text" placeholder="tripId"--%>
        <%--                            style="width:250px;"/>--%>
        <%--                <form:errors path="tripId" cssClass="text-danger"/>--%>

        <%--            </div>--%>
        <%--            <div class="form-group mx-sm-3 mb-2">--%>
        <%--                <form:input class="form-control" path="userFromId" type="text"--%>
        <%--                            placeholder="userFromId" style="width:250px;"/>--%>
        <%--                <form:errors path="userFromId" cssClass="text-danger"/>--%>
        <%--            </div>--%>


        <%--            <div class="form-group mx-sm-3 mb-2">--%>
        <%--                <form:input class="form-control" path="userFromComment" type="text"--%>
        <%--                            placeholder="userFromComment" style="width:250px;"/>--%>
        <%--                <form:errors path="userFromComment" cssClass="text-danger"/>--%>
        <%--            </div>--%>


        <%--            <div class="form-group mx-sm-3 mb-2">--%>
        <%--                <form:input class="form-control" path="userToId" type="text"--%>
        <%--                            placeholder="userToId" style="width:250px;"/>--%>
        <%--                <form:errors path="userToId" cssClass="text-danger"/>--%>
        <%--            </div>--%>


        <%--            <div class="form-group mx-sm-3 mb-2">--%>
        <%--                <form:input class="form-control" path="comment" type="text"--%>
        <%--                            placeholder="comment" style="width:250px;"/>--%>
        <%--                <form:errors path="comment" cssClass="text-danger"/>--%>
        <%--            </div>--%>

        <%--            <div class="form-group mx-sm-3 mb-2">--%>
        <%--                <form:input class="form-control" path="rating" type="text"--%>
        <%--                            placeholder="rating" style="width:250px;"/>--%>
        <%--                <form:errors path="rating" cssClass="text-danger"/>--%>
        <%--            </div>--%>


        <%--        </form:form>--%>
    </div>
</section>
</body>
</html>

