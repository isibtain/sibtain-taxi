<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sprin" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Aser Ahmad
  Email: aaahmad@mum.edu
--%>

<html>
<head>
    <title><spring:message code="whoWeAre.title"/></title>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1>
            <spring:message code="whoWeAre.heading"/>
        </h1>
        <h2>
            <spring:message code="whoWeAre.mainLine"/>
        </h2>
    </div>
</div>
<div class="container">
    <div>
        <h3>
            <spring:message code="whoWeAre.tagline"/>
        </h3>
    </div>
    <div class="panel-body">
        <div class="form:input-large">
            <a href="mailto:amahmadi@mum.edu">Ali Mohammad Ahmadi</a>, <spring:message code="Id"/>: 610105<br/>
            <a href="mailto:aakanwal@mum.edu">Asad Ali Kanwal</a>, <spring:message code="Id"/>: 610147<br/>
            <a href="mailto:aaahmad@mum.edu">Aser Ahmad Ibrahim Ahmad</a>, <spring:message code="Id"/>: 610086<br/>
            <a href="mailto:jsvallon@mum.edu">John Styves Vallon</a>, <spring:message code="Id"/>: 610087
        </div>
    </div>
    <div>
        <h3>
            <spring:message code="whoWeAre.bottomLine"/>
        </h3>
    </div>
</div>
</body>
</html>
