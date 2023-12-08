$(document).ready(function () {
    getArtists();
});

function getArtists() {
    $.ajax({
        url: "/Jingle_App/ArtistServlet",
        method: "GET",
        dataType: "json",
        success: function (data) {
            console.log(data);
        },
        error: function (error) {
            console.error("Error fetching artists:", error);
        },
    });
}
