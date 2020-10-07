<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="Spring" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="http://getbootstrap.com/dist/css/bootstrap.css"rel="stylesheet">
    <link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyAPa16UTP31DOP2Yp688Tymq3DHGzSQ6kg&sensor=false" type="text/javascript"></script>
    <title>Welcome</title>
    <style>
        #map {
            height: 100%;
        }
    </style>
</head>
<body>


<div class="container">
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="<spring:url value="/resources/images/image_one.jpg" />"
                     alt="First slide"/>

            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<spring:url value="/resources/images/image_one.jpg" />"
                     alt="First slide"/>

            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<spring:url value="/resources/images/image_one.jpg" />"
                     alt="First slide"/>

            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>


    </div>
    <div class="shadow-lg p-3 mb-5 bg-white rounded">

        <div class="row justify-content-center align-items-center">


            <form:form modelAttribute="searchTrip" action="search_Trip" method="post" class="form-inline">

                <div class="form-group mb-2">
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <form:input path="origin_search" type="text" class="form-control" id="origin_search" placeholder="Origin"/>
                    <form:errors path="origin_search" cssClass="text-danger"/>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <form:input path="destination_search" type="text" class="form-control" id="destination_search" placeholder="Destination"/>
                    <form:errors path="destination_search" cssClass="text-danger"/>
                </div>

                <div class="form-group mx-sm-3 mb-2">
                    <button type="submit" class="btn btn-info">
                        <span class="glyphicon glyphicon-search"></span> Search
                    </button>
                </div>

            </form:form>
        </div>
    </div>

    <div style="margin-top:10px;"></div>

    <div id="map" style="height: 300px;">
    </div>

    <div style="margin-top:10px;"></div>

    <c:forEach items="${listLastTentrip}" var="trips">
        <spring:url value="/joinTrip" var="joinTrip">

            <spring:param value="${trips.tripId}" name="tripId"/>
        </spring:url>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${trips.origin} To ${trips.destination}</h5>
                <a href="${joinTrip}" class="btn btn-info">JOIN TRIP</a>
            </div>
        </div>

        <div style="margin-top:10px;"></div>
    </c:forEach>




    <p id="from_js"></p>


</div>

<div style="margin-top:100px;"></div>


<script>
    <%--var allpermissionList = eval(${listLastTentrip});--%>

    <%--var map = new google.maps.Map(document.getElementById('map'), {--%>
    <%--    zoom: 10,--%>
    <%--    center: new google.maps.LatLng(-33.92, 151.25),--%>
    <%--    mapTypeId: google.maps.MapTypeId.ROADMAP--%>
    <%--});--%>

    <%--var infowindow = new google.maps.InfoWindow();--%>

    <%--var marker, i;--%>


    <%--$.each(allpermissionList, function (index, permission) {--%>

    <%--    /* document.getElementById('from_js').innerHTML = "6666"; */--%>
    <%--    console.log( "Lat"+permission.destinationLat +"Lng "+permission.destinationLng);--%>
    <%--    marker = new google.maps.Marker({--%>
    <%--        position: new google.maps.LatLng(permission.destinationLng,permission.destinationLat),--%>
    <%--        map: map--%>
    <%--    });--%>

    <%--    google.maps.event.addListener(marker, 'click', (function(marker, i) {--%>
    <%--        return function() {--%>
    <%--            infowindow.setContent(locations[i][0]);--%>
    <%--            infowindow.open(map, marker);--%>
    <%--        }--%>
    <%--    })(marker, index));--%>

    <%--});--%>



    var locations = [
        ['Bondi Beach', -33.890542, 151.274856, 4],
        ['Coogee Beach', -33.923036, 151.259052, 5],
        ['Cronulla Beach', -34.028249, 151.157507, 3],
        ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
        ['Maroubra Beach', -33.950198, 151.259302, 1]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 10,
        center: new google.maps.LatLng(-33.92, 151.25),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map
        });

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));
    }





</script>


</body>
</html>