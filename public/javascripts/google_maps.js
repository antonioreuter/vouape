var map;
var markersArray = [];
var start_marker;
var bounds;


$(function () {
    // Creating a MapOptions object with the required properties

    

    var latlng = new google.maps.LatLng(-23.5869956, -46.634178);

    var options = {
            
        zoom: 16,

        center: latlng,

        draggable: true,

        scrollwheel: true,

        scaleControl: true,

        streetViewControl: true,

        keyboardShortcuts: false,

        disableDoubleClickZoom: false,

        backgroundColor: "#6698FF",

        mapTypeId: google.maps.MapTypeId.ROADMAP,

        mapTypeControle: true,

        mapTypeControlOptions: {
            mapTypeIds: [
            google.maps.MapTypeId.ROADMAP,
            google.maps.MapTypeId.SATELLITE
            ]
        }
            
    };
    // Creating the map
    map = new google.maps.Map(document.getElementById('googlemap'), options);


});







function addPoints(id, lat, lng, title, desc) {   
    //cria um Marker
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, lng),
        map: map,
        title: id + " || "+ title
    });

    markersArray.push(marker);

    bounds.extend(marker.position);

    // Wrapping the event listener inside an anonymous function
    // that we immediately invoke and passes the variable i to.
    (function(id, marker) {
        // Creating the event listener. It now has access to the values of
        // i and marker as they were during its creation
        google.maps.event.addListener(marker, 'click', function() {
            var infowindow = new google.maps.InfoWindow({
                content: desc
            });
            infowindow.open(map, marker);
        });
    })(id, marker);
   
}

function clearOverlays() {    
    if (markersArray) {
    
        for (i=0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
    }
    markersArray = new Array();
    bounds = new google.maps.LatLngBounds();
}

function fit_map(){
    map.fitBounds(bounds);
}

function codeAddress() {
    var localizacao = $("#localizacao").val();
    
    var geocoder = new google.maps.Geocoder();

    
    if (geocoder) {
        
        geocoder.geocode( {
            address: localizacao
        },function(results, status){
            if ( status == google.maps.GeocoderStatus.OK){
                var loc = results[0].geometry.location;
                
                lat = results[0].geometry.location.lat();
                lng = results[0].geometry.location.lng();
               
                $("#ref_latitude").val(lat);

                $("#ref_longitude").val(lng);
                return true;
            } else {
                
                return false;

            }
        })
    }

   
}





function findPromotionsLocale() {
    alert("Buscando promocoes...")
    var street = $("#promotion_street").val();
    var city = $("#promotion_locality").val();
    var country = $("#promotion_country").val();

    var addressLocale = street +", "+city+", "+country;

    alert("Address "+addressLocale)
    
    var geocoder = new google.maps.Geocoder();


    if (geocoder) {

        geocoder.geocode( {
            address: addressLocale
        },function(results, status){
            if ( status == google.maps.GeocoderStatus.OK){
                var loc = results[0].geometry.location;

                lat = results[0].geometry.location.lat();
                lng = results[0].geometry.location.lng();

                alert("Lat "+lat)

                $("#promotion_latitude").val(lat);

                $("#promotion_longitude").val(lng);
                return true;
            } else {

                return false;

            }
        })
    }


}