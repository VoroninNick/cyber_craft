initializeGMaps = function() {
    var lat, latlng, lng, map, mapOptions, marker, styledMap, styles;
    lat = 49.830312;
    lng = 24.042679; // 49.810126, 23.971897
    latlng = new google.maps.LatLng(lat, lng);


    // 49.827724, 24.04284
    var center_lat_lng = new google.maps.LatLng(49.82778, 24.042797)

    styles = [
        {
            featureType: 'all',
            stylers: [
                { "saturation": -95 },
                { "lightness": 1 },
                { "gamma": 0.95 }
            ]
        }
    ];
    styledMap = new google.maps.StyledMapType(styles, {
        name: "Styled Map"
    });
    mapOptions = {
        zoom: 16,
        center: center_lat_lng,
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, "map_style"]
        }
    };

    var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        //'<h1 id="firstHeading" class="firstHeading" style="text-align: center;">CyberCraft</h1>'+
        '<div id="bodyContent" style="text-align: center;">'+
        '<img src="/assets/logo.png" style="width: 100px">'+
        '<p>' +
        '7 Slipoho Str. <br />'+
        'Lviv, Ukraine, 79017 <br />'+
        '<br />'+
        //'+38 (067) 340-26-13 <br />'+
        //'+38 (032) 295-72-96 <br />'+
        '</p>'+
        '</div>'+
        '</div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });


    var map_html_element = $(".g_map").get(0)
    map = new google.maps.Map(map_html_element, mapOptions);
    map.mapTypes.set("map_style", styledMap);
    map.setMapTypeId("map_style");
    marker = new google.maps.Marker({
        position: latlng,
        map: map,
        title: "Наутика",
        icon: '/assets/cc-map-icon-1.png'
    });

    google.maps.event.addListener(marker, 'click', function(e) {
        //infowindow.open(map,marker);
        var $info_window_parent = $(".map_message")
        var $info_window = $info_window_parent.find("#my-info-window")
        if (!$info_window.length) {
            $info_window = $("<div id='my-info-window'>" + contentString + "</div>")
            $info_window_parent.append($info_window)

        }
        else{
            $info_window.show()
        }

        //var left;
        //var top;
        //console.log("e", e)
        //$info_window.css({left: left, top: top})
    });
};


initializeGMaps()

