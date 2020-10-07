<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add new Trip</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style type="text/css">@import url("<spring:url value="/resources/css/main.css"/>");</style>

    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }

        /* Optional: Makes the sample page fill the window. */
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #description {
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
        }

        #infowindow-content .title {
            font-weight: bold;
        }

        #infowindow-content {
            display: none;
        }

        #map #infowindow-content {
            display: inline;
        }

        .pac-card {
            margin: 10px 10px 0 0;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            font-family: Roboto;
        }

        #pac-container {
            padding-bottom: 12px;
            margin-right: 12px;
        }

        .pac-controls {
            display: inline-block;
            padding: 5px 11px;
        }

        .pac-controls label {
            font-family: Roboto;
            font-size: 13px;
            font-weight: 300;
        }

        #pac-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 400px;
        }

        #pac-input:focus {
            border-color: #4d90fe;
        }

        #title {
            color: #fff;
            background-color: #4d90fe;
            font-size: 25px;
            font-weight: 500;
            padding: 6px 12px;
        }
    </style>
</head>

<body>


<div class="container">




    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Some text in the Modal..</p>
        </div>

    </div>







    <div class="shadow-lg p-3 mb-5 bg-white rounded">
        <div class="row justify-content-center align-items-center">

            <form:form modelAttribute="newTrip" class="form-inline" method="post">

                <button type="submit" disabled style="display: none" aria-hidden="true"></button>

                <form:hidden path="originLat" id="originLat" value=""/>
                <form:hidden path="originLng" id="originLng" value=""/>
                <form:hidden path="destinationLat" id="destinationLat" value=""/>
                <form:hidden path="destinationLng" id="destinationLng" value=""/>
                <form:hidden path="originDate" id="originDate" value=""/>
                <form:hidden path="destinationDate" id="destinationDate" value=""/>


                <div class="form-group mb-2">
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <form:input class="form-control" path="origin" id="origin-input" type="text"
                                placeholder="Enter origin" style="width:250px;"/>
                    <form:errors path="origin" cssClass="text-danger"/>

                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <form:input class="form-control" path="destination" id="destination-input" type="text"
                                placeholder="Enter destination" style="width:250px;"/>
                    <form:errors path="destination" cssClass="text-danger"/>
                </div>


                <div class="form-group mb-2">
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <input class="form-control" id="start" type="date" style="width:250px;" placeholder="mm/dd/yyyy"/>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <input class="form-control" type="date" id="end" style="width:250px;" placeholder="mm/dd/yyyy"/>
                </div>


<%--                <buttons type="submit" class="btn btn-info hideView" id="finishTrip">--%>
<%--                    Add Trip--%>
<%--                </button>--%>

                <div id="next_step" class="text-center hideView">
                    <button class="btn btn-info" type="button" onclick="popupfee()">Process to Fee</button>
                </div>


                <div id="formInput" class="hideView">
                    <h3 align="center">One Last Step</h3>

                    <div class="form-group">
                        <label for="name"> Number of Rider: </label>
                        <form:input type="number" path="numberPeople" id="numberPeople" min="1" class="form-control"/>
                        <form:errors path="numberPeople" cssClass="text-danger"/>
                        <br>
                    </div>

                    <div class="form-group">
                        <label for="description"> Fee: </label>
                        <form:radiobutton path="PaymentType" value="1" id="gaz_choice" onclick="showHideFee()"/>Gas
                        <form:radiobutton path="PaymentType" value="2" id="money_choice" onclick="showHideFee()"/>Money
                        <form:errors path="PaymentType" cssClass="text-danger"/>


                    </div>
                    <div class="form-group">
                        <form:input path="fees" type="number" placeholder="Put number of Gallon" class="hideView"
                                    id="fee_gaz" min="1" />
                        <form:errors path="fees" cssClass="text-danger"/>
                        <br>
                    </div>

                    <input type="submit" value="Add Trip" class="hideView" id="finishTrip"/>




                    <h4 align="center">
                        <a href="#"
                           onclick="make_hidden('formInput'); make_hidden('result');resetForm('categoryForm');">
                            <b>EXIT</b> </a>
                    </h4>

                </div>

            </form:form>
        </div>
    </div>


    <div id="mode-selector">
    </div>
    <div id="total"></div>

    <div id="map" style="height:500px;">
    </div>


</div>


<script>
    var infowindow;

    var destlat;
    var destlng;
    var origlat;
    var origlng;
    var end;
    var start;

    var numberRider;
    var gazAsfee;
    var moneyAsfee;


    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            mapTypeControl: false,
            center: {
                lat: -25.7234,
                lng: 28.4222
            },
            zoom: 14
        });
        infowindow = new google.maps.InfoWindow();
        new AutocompleteDirectionsHandler(map);
    }


    function showNextStep() {
        if (destlat != null && destlng != null && origlat != null && origlng != null) {
            document.getElementById("next_step").style.display = "block";
        }
    }


    function showHideFee() {
        var gaz_choice = document.getElementById("gaz_choice");
        var money_choice = document.getElementById("money_choice");
        document.getElementById("fee_gaz").style.display = "block";
        if (gaz_choice.checked) {
            document.getElementById("fee_gaz").placeholder = "Put number of Gallon";
        }

        if (money_choice.checked) {
            document.getElementById("fee_gaz").placeholder = "Put the amount";
        }
    }


    function AutocompleteDirectionsHandler(map) {
        this.map = map;
        this.originPlaceId = null;
        this.destinationPlaceId = null;

        this.travelMode = 'DRIVING';
        var originInput = document.getElementById('origin-input');
        var destinationInput = document.getElementById('destination-input');


        var modeSelector = document.getElementById('mode-selector');
        this.directionsService = new google.maps.DirectionsService();
        this.directionsDisplay = new google.maps.DirectionsRenderer();
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(originInput);
        var destinationAutocomplete = new google.maps.places.Autocomplete(destinationInput);


        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');


        start = document.getElementById('start');
        end = document.getElementById('end');

        numberRider = document.getElementById('numberPeople');
        gazAsfee = document.getElementById('fee_gaz');
        // moneyAsfee           = document.getElementById('fee_money');

        numberRider.addEventListener('change', doThing);
        gazAsfee.addEventListener('change', doThing);
        // moneyAsfee.addEventListener('change', doThing);

    }

    function doThing() {
        if (!isEmpty(numberRider.value)) {
            if (!isEmpty(gazAsfee.value) || !isEmpty(moneyAsfee.value))
                document.getElementById('finishTrip').style.display = 'block';
            else
                document.getElementById('finishTrip').style.display = 'none';

        } else
            document.getElementById('finishTrip').style.display = 'none';
    }


    // Sets a listener on a radio button to change the filter type on Places
    // Autocomplete.
    AutocompleteDirectionsHandler.prototype.setupClickListener = function (id, mode) {
        var radioButton = document.getElementById(id);
        var me = this;
        radioButton.addEventListener('click', function () {
            me.travelMode = mode;
            me.route();
        });
    };

    AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function (autocomplete, mode) {
        var me = this;
        autocomplete.bindTo('bounds', this.map);
        autocomplete.addListener('place_changed', function () {
            var place = autocomplete.getPlace();
            if (!place.place_id) {
                window.alert("Please select an option from the dropdown list.");
                return;
            }


            if (mode === 'ORIG') {

                origlat = place.geometry.location.lat();
                origlng = place.geometry.location.lng();


                document.getElementById('originLat').value = place.geometry.location.lat();
                document.getElementById('originLng').value = place.geometry.location.lng();


                me.originPlaceId = place.place_id;
            } else {
                me.destinationPlaceId = place.place_id;
                destlat = place.geometry.location.lat();
                destlng = place.geometry.location.lng();

                document.getElementById('destinationLat').value = place.geometry.location.lat();
                document.getElementById('destinationLng').value = place.geometry.location.lng();

            }

            me.route();
        });

    };

    AutocompleteDirectionsHandler.prototype.route = function () {
        if (!this.originPlaceId || !this.destinationPlaceId) {
            return;
        }
        var me = this;

        this.directionsService.route({
            origin: {
                'placeId': this.originPlaceId
            },
            destination: {
                'placeId': this.destinationPlaceId
            },
            travelMode: this.travelMode
        }, function (response, status) {
            if (status === 'OK') {
                me.directionsDisplay.setDirections(response);
                var center = response.routes[0].overview_path[Math.floor(response.routes[0].overview_path.length / 2)];
                infowindow.setPosition(center);
                infowindow.setContent(response.routes[0].legs[0].duration.text + "<br>" + response.routes[0].legs[0].distance.text);

                new showNextStep();

                infowindow.open(me.map);
            } else {
                window.alert('Directions request failed due to ' + status);
            }

        });
    };

    google.maps.event.addDomListener(window, "load", initMap);

    function popupfee() {
        if (isEmpty(start.value) || isEmpty(end.value)) {
            alert("Choose Start and End Date")
        } else {
            document.getElementById('originDate').value = start.value;
            document.getElementById('destinationDate').value = end.value;
            new make_visible('formInput');
        }

    }

    function isEmpty(value) {
        if (value === '' || value === null || value === undefined) {
            return true
        } else {
            return false
        }
    }

    resetForm = function (id) {
        var element = document.getElementById(id);
        $(element)[0].reset();

    }

    function make_hidden(id) {
        var e = document.getElementById(id);
        e.style.display = 'none';
    }

    function make_visible(id) {
        var e = document.getElementById(id);
        e.style.display = 'block';
    }

    // Translate form to array
    // Then put in JSON format
    function serializeObject(form) {
        var jsonObject = {};
        var array = form.serializeArray();
        $.each(array, function () {
            jsonObject[this.name] = this.value;
        });
        return jsonObject;

    };
</script>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPa16UTP31DOP2Yp688Tymq3DHGzSQ6kg&libraries=places&callback=initMap"
        async defer></script>
</body>

</html>
