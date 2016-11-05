// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org///

var event_street, event_housenumber, event_city, google_maps_object;

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 51.5174, lng: -0.12},
        zoom: 13
    });
    var input = /** @type {!HTMLInputElement} */(
        document.getElementById('pac-input'));

    var types = document.getElementById('type-selector');
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    autocomplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
        }));
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);

        // parse the json to retrieve street, number and city of the event location
        for (i =0; i < place.address_components.length; i++) {
            // console.log("this is i: ", i);
            if (place.address_components[i]["types"]["0"] == "route") {
                // console.log("hi2")
                event_street = place.address_components[i]["long_name"]
            }
            if (place.address_components[i]["types"]["0"] == "street_number"){
                event_housenumber = place.address_components[i]["long_name"]
            }
            if (place.address_components[i]["types"]["0"] == "locality"){
                event_city = place.address_components[i]["long_name"]
            }
        }

        // might be able to display this using the Google Maps API on events pages
        google_maps_object = place.address_components;

        // test that street, number and city are correct
        console.log("street: ", event_street);
        console.log("number: ", event_housenumber);
        console.log("city: ", event_city);

    });

}



