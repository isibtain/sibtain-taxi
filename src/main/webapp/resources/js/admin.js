$(document).ready(function () {


    // For Rider
    $(".approve").on("click", function () {
        console.log("approve clicks");
        var contextRoot = "/" + window.location.pathname.split('/')[1];

        var userID = $(this).data("userid");
        // var userID = 1;
        console.log("contextRoot", contextRoot);
        console.log("userID", userID);

        $.ajax({
            url: contextRoot + "/rest/updateUser/" + userID,
            type: 'GET',
            contentType: 'application/json',
            success: function (response) {
                // alert("Product Successfully added to the Cart!");
                $(".card-" + userID).slideUp();

            },
            error: function () {
                // alert('Error while request..');
                $(".card-" + userID).slideUp();
            }
        });
    })


    // For Driver
    $(".approve-driver").on("click", function () {
        console.log("Driver clicks");
        var contextRoot = "/" + window.location.pathname.split('/')[1];

        var userID = $(this).data("userid");
        // var userID = 1;
        console.log("contextRoot", contextRoot);
        console.log("userID", userID);

        $.ajax({
            url: contextRoot + "/rest/updateDriver/" + userID,
            type: 'GET',
            dataType: "json",
            success: function (response) {
                // alert("Product Successfully added to the Cart!");
                $(".card-d" + userID).slideUp();

            },
            error: function () {
                // alert('Error while request..');
                $(".card-d" + userID).slideUp();
            }
        });
    })
});

