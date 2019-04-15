function initMap()
{

    // var directionsService = new google.maps.DirectionsService;

    lat = -34.6137;
    lng = -58.4560;
    var zoom = 13;

    var styles = {
        default: null,
        hide: [
          {
            featureType: 'poi',
            stylers: [{visibility: 'off'}]
          },
          {
            featureType: 'transit',
            elementType: 'labels.icon',
            stylers: [{visibility: 'off'}]
          }
        ]
    };

    var map = new google.maps.Map(

        document.getElementById( 'gmap' ),
        {

            center: {lat: lat, lng: lng},

            zoom: zoom,

            disableDefaultUI: true

        }

    );

    // var directionsDisplay = new google.maps.DirectionsRenderer({map: map});

    // var stepDisplay = new google.maps.InfoWindow;

    // calculateAndDisplayRoute( directionsDisplay, directionsService, markerArray, stepDisplay, map );

    map.setOptions( { styles: styles[ 'hide' ] } );

    var marker = new google.maps.Marker(
    {

      position: new google.maps.LatLng( -34.651763, -58.383059 ),

      map: map,

      icon: '../../../../skin/images/body/icons/home_pin.png'

    });

    var locations = [];

    $( '.Purchase' ).each( function()
    {

        var pID = $( this ).val();

        var purchase = $( '#purchase_data' + pID ).val().replace( /'/g, '"');

				purchase = JSON.parse( purchase	);

        if( !locations[ purchase[ 'lat' ] + ',' + purchase[ 'lng' ] ] || purchase[ purchase[ 'lat' ] + ',' + purchase[ 'lng' ] ] == 'undefined' )
        {
            locations[ purchase[ 'lat' ] + ',' + purchase[ 'lng' ] ] = true;

            var latLng = new google.maps.LatLng( purchase[ 'lat' ], purchase[ 'lng' ] );

        }else{

            var variation = 0.0001;

            locations[ ( parseFloat( purchase[ 'lat' ] ) + variation ).toString() + ',' + ( parseFloat( purchase[ 'lng' ] ) + variation ).toString() ] = true;

            var latLng = new google.maps.LatLng( (  parseFloat(purchase[ 'lat' ]) + variation ).toString() , ( parseFloat( purchase[ 'lng' ] ) + variation ).toString() );

        }

        var marker = new google.maps.Marker(
        {

          position: latLng,

          map: map,

          icon: '../../../../skin/images/body/icons/' + $( '#purchase_color' + pID ).val() + '_pin.png'

        });

        // marker.infowindow.open( map, marker );

        // var pathBetween = new google.maps.Polyline(
        // {
        //
        //     path: latLng,
        //
        //     strokeColor: '#FF0000',
        //
        //     strokeOpacity: 1.0,
        //
        //     strokeWeight: 2
        //
        // });
        //
        // pathBetween.setMap( map );


        marker.infowindow = new google.maps.InfoWindow();

        marker.addListener( 'click', function()
        {

            var addressHTML = '<h3><strong><i class="fa fa-map"></i> ' + purchase[ 'address' ] + '</strong></h3>';

            var companyHTML = '<h4><i class="fa fa-building"></i> ' + purchase[ 'name' ] + '</h4>';

            var dateHTML = '<h4><strong><i class="fa fa-calendar"></i> ' + weekday( purchase[ 'delivery_date' ] ) + ' ' + dateFormat( purchase[ 'delivery_date' ] ) + '</strong></h4>';

            var timetable = '<h5><i class="fa fa-clock-o"></i> D&iacute;as y Horarios de Recepci&oacute;n<br>';

            if( purchase[ 'monday_from' ] )
            {

                timetable = timetable + 'Lunes de ' + purchase[ 'monday_from' ] + ' a ' + purchase[ 'monday_to' ] + '<br>';

            }

            if( purchase[ 'tuesday_from' ] )
            {

                timetable = timetable + 'Martes de ' + purchase[ 'tuesday_from' ] + ' a ' + purchase[ 'tuesday_to' ] + '<br>';

            }

            if( purchase[ 'wensday_from' ] )
            {

                timetable = timetable + 'Mi&eacute;rcoles de ' + purchase[ 'wensday_from' ] + ' a ' + purchase[ 'wensday_to' ] + '<br>';

            }

            if( purchase[ 'thursday_from' ] )
            {

                timetable = timetable + 'Jueves de ' + purchase[ 'thursday_from' ] + ' a ' + purchase[ 'thursday_to' ] + '<br>';

            }

            if( purchase[ 'friday_from' ] )
            {

                timetable = timetable + 'Viernes de ' + purchase[ 'friday_from' ] + ' a ' + purchase[ 'friday_to' ] + '<br>';

            }

            if( purchase[ 'saturday_from' ] )
            {

                timetable = timetable + 'S&aacute;bados de ' + purchase[ 'saturday_from' ] + ' a ' + purchase[ 'saturday_to' ] + '<br>';

            }

            if( purchase[ 'sunday_from' ] )
            {

                timetable = timetable + 'Domingos de ' + purchase[ 'sunday_from' ] + ' a ' + purchase[ 'sunday_to' ] + '<br>';

            }

            timetable = timetable + '</h5><br>';

            var extraInfo = '';

            if(  purchase[ 'extra' ] )
            {

                extraInfo = '<h5><i class="fa fa-user-secret"></i> Información para el cliente:<br><strong><span class="text-green">' + purchase[ 'extra' ] + '</span></strong></h5>'

            }

            var additionalInfo = '';

            if(  purchase[ 'additional_information' ] )
            {

                additionalInfo = '<h5><i class="fa fa-info-circle"></i> Información para el reparto:<br><strong><span class="text-warning">' + purchase[ 'additional_information' ] + '</span></strong></h5>'

            }

            var addHidden = '';

            var removeHidden = '';

            var pIDs = $( '#selected_purchases' ).val().split( ',' );

            if(  $.inArray( pID, pIDs ) == -1  )
            {

                removeHidden = 'Hidden';

            }else{

                addHidden = 'Hidden';

            }

            var addButton = '<span id="add' + pID + '" class="btn btn-primary addPurchase ' + addHidden + '" purchase="' + pID + '"><i class="fa fa-plus"></i> Agregar al reparto</span>';

            var removeButton = '<span id="remove' + pID + '" class="btn btn-danger removePurchase ' + removeHidden + '" purchase="' + pID + '"><i class="fa fa-times"></i> Quitar del reparto</span>';

            // marker.infowindow = new google.maps.InfoWindow();

            marker.infowindow.setContent( '<div>' + addressHTML + companyHTML + dateHTML + timetable + extraInfo + additionalInfo + '<div class="txC">' + addButton + removeButton + '</div></div>' );

            marker.infowindow.open( map, marker );

            addPurchase();

        		removePurchase();

        });

        marker.infowindow.open(map, marker);

        marker.infowindow.close();

    });

    // var input = /** @type {!HTMLInputElement} */(
    //     document.getElementById('pac-input'+mapID));

    //var types = document.getElementById('type-selector');

    // map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);

    //map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

    // var autocomplete = new google.maps.places.Autocomplete(input);
    // autocomplete.bindTo('bounds', map);



    // var marker = new google.maps.Marker({
    //   map: map,
    //   anchorPoint: new google.maps.Point(0, -29),
    //   stylers: [{color: '#c9b2a6'}]
    // });
    //
    // if(typeof myLatlng !== 'undefined')
    // {
    //   marker.setPosition(myLatlng);
    // }

    // autocomplete.addListener('place_changed', function() {
    //   emptyValues(mapID);
    //   infowindow.close();
    //   marker.setVisible(false);
    //   var place = autocomplete.getPlace();
    //   //console.log(place);
    //   if (!place.geometry) {
    //     // User entered the name of a Place that was not suggested and
    //     // pressed the Enter key, or the Place Details request failed.
    //     // addressNotFound(place.name,mapID);
    //     //window.alert("No ha sido posible encontrar: '" + place.name + "'");
    //     return;
    //   }
    //
    //   // If the place has a geometry, then present it on a map.
    //   if (place.geometry.viewport) {
    //     map.fitBounds(place.geometry.viewport);
    //   } else {
    //     map.setCenter(place.geometry.location);
    //     map.setZoom(13);
    //   }
    //   marker.setPosition(place.geometry.location);
    //   marker.setVisible(true);
    //
    //   var address = '';
    //   if (place.address_components) {
    //     address = [
    //       (place.address_components[1] && place.address_components[1].short_name || ''),
    //       (place.address_components[0] && place.address_components[0].short_name || ''),
    //       (place.address_components[2] && place.address_components[2].short_name || ''),
    //       (place.address_components[3] && place.address_components[3].short_name || ''),
    //       (place.address_components[4] && place.address_components[4].short_name || ''),
    //       (place.address_components[5] && place.address_components[5].long_name || ''),
    //       (place.address_components[6] && place.address_components[6].long_name || '')
    //     ].join(', ');
    //   }
    //
    // var place_values = place.address_components
    // place_values.reverse();
    //
    // // place_values.forEach(function(value) {
    // //     fillHiddenFields(value,mapID);
    // // });
    //
    //
    //
    // // Send data to iframe parent page
    // // parent.getMapsValues();//// http://www.forosdelweb.com/f13/como-puedo-obtener-datos-iframe-1036765/http://www.forosdelweb.com/f13/como-puedo-obtener-datos-iframe-1036765/
    // document.getElementById("map"+mapID+"_lat").value = place.geometry.location.lat();
    // document.getElementById("map"+mapID+"_lng").value = place.geometry.location.lng();
    // //parent.$('body').contents().find('#google_maps_button').trigger('click');
    //
    //   infowindow.setContent('<div><strong>' + address + '</strong>');
    //   infowindow.open(map, marker);
    // });
  }

    // function fillHiddenFields(object,mapID)
    // {
    //     switch(object.types[0])
    //     {
    //         case 'street_number':
    //             document.getElementById("map"+mapID+"_address").value = document.getElementById("map"+mapID+"_address").value +" "+ object.long_name;
    //             document.getElementById("map"+mapID+"_address_short").value = document.getElementById("map"+mapID+"_address_short").value +" "+ object.short_name;
    //         break;
    //         case 'route':
    //             document.getElementById("map"+mapID+"_address").value = object.long_name;
    //             document.getElementById("map"+mapID+"_address_short").value = object.short_name;
    //         break;
    //         case 'sublocality_level_1':
    //             document.getElementById("map"+mapID+"_zone").value = object.long_name;
    //             document.getElementById("map"+mapID+"_zone_short").value = object.short_name;
    //         break;
    //         case 'locality':
    //             document.getElementById("map"+mapID+"_zone").value = object.long_name;
    //             document.getElementById("map"+mapID+"_zone_short").value = object.short_name;
    //         break;
    //         case 'administrative_area_level_2':
    //             document.getElementById("map"+mapID+"_region").value = object.long_name;
    //             document.getElementById("map"+mapID+"_region_short").value = object.short_name;
    //         break;
    //         case 'administrative_area_level_1':
    //             document.getElementById("map"+mapID+"_province").value = object.long_name;
    //             document.getElementById("map"+mapID+"_province_short").value = object.short_name;
    //         break;
    //         case 'country':
    //             document.getElementById("map"+mapID+"_country").value = object.long_name;
    //             document.getElementById("map"+mapID+"_country_short").value = object.short_name;
    //         break;
    //         case 'postal_code':
    //             document.getElementById("map"+mapID+"_postal_code").value = object.long_name;
    //         break;
    //         case 'postal_code_suffix':
    //             document.getElementById("map"+mapID+"_postal_code_suffix").value = object.long_name;
    //         break;
    //     }
    //
    //     if($("#postal_code_"+mapID).length>0)
    //     {
    //         if($('#map'+mapID+'_postal_code').val())
    //         {
    //             $("#postal_code_"+mapID).prop("disabled",true);
    //             var pc = $("#map"+mapID+"_postal_code").val();
    //             if($('#map'+mapID+'_postal_code_suffix').val())
    //             {
    //                 pc = $('#map'+mapID+'_postal_code_suffix').val() +" "+ pc;
    //             }
    //             $("#postal_code_"+mapID).val(pc);
    //         }else{
    //             $("#postal_code_"+mapID).prop("disabled",false);
    //             $("#postal_code_"+mapID).val('');
    //         }
    //     }
    //
    //     if($("#address_"+mapID).length>0)
    //     {
    //         if($('#map'+mapID+'_address').val())
    //         {
    //             $("#address_"+mapID).prop("disabled",true);
    //             $("#address_"+mapID).val($("#map"+mapID+"_address").val());
    //         }else{
    //             $("#address_"+mapID).prop("disabled",false);
    //             $("#address_"+mapID).val('');
    //         }
    //     }
    // }
