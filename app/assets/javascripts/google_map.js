get_lat_lng_by_string = function(str){
    var lat_lng = null
    var arr = null
    if (str && str.length){
        arr = str.split(",").map(function(a){return parseInt(a)})
        if (arr && arr.length){
            lat_lng = new google.maps.LatLng(arr[0], arr[1])
        }
    }

    return lat_lng
}
initializeGMaps = function(selector, info_window_parent_selector) {
    var $map = $(selector)
    var map_html_element = $map.get(0)
    var lat, latlng, lng, map, mapOptions, marker, styledMap, styles;

    var marker_lat_lng = get_lat_lng_by_string($map.attr("data-marker"))
    if (!marker_lat_lng) {
        lat = 49.830312;
        lng = 24.042679; // 49.810126, 23.971897
        marker_lat_lng = new google.maps.LatLng(lat, lng);
    }


    // 49.827724, 24.04284
    var center_lat_lng = null
    if ($map.hasAttribute("center-map-by-marker")){
        center_lat_lng = marker_lat_lng
    }
    else {
        center_lat_lng = get_lat_lng_by_string($map.attr("data-center"))
        if (!center_lat_lng) {
            center_lat_lng = new google.maps.LatLng(49.82778, 24.042797)
        }
    }

    styles = [
        {
            featureType: 'all',
            stylers: [
                { "saturation": -75 },
                { "lightness": 25 },
                { "gamma": 1 },
                {hue: "#2c7daf"}
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
        '<img src="'+images.logo_png+'" style="width: 100px">'+
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



    map = new google.maps.Map(map_html_element, mapOptions);
    map.mapTypes.set("map_style", styledMap);
    map.setMapTypeId("map_style");
    marker = new google.maps.Marker({
        position: marker_lat_lng,
        map: map,
        title: "CyberCraft",
        icon: '/assets/cc-map-icon-1.png'
    });

    google.maps.event.addListener(marker, 'click', function(e) {
        //infowindow.open(map,marker);
        var $info_window_parent = $(info_window_parent_selector)
        var $info_window = $info_window_parent.find("#my-info-window")

        if (!$info_window.length) {
            $info_window = $("<div id='my-info-window'>" + contentString + "</div>")
            $info_window_parent.append($info_window)

        }
        else{
            if ($info_window.filter(":visible").length){
                $info_window.hide()
            }
            else{
                $info_window.show()
            }

        }

        //var left;
        //var top;
        //console.log("e", e)
        //$info_window.css({left: left, top: top})
    });
};


var google_map_selector = null
var info_window_parent_selector = ".map_message"
if($(".g_map").length) {
    google_map_selector = ".g_map"
}
else if($(".contacts-map").length){
    google_map_selector = ".contacts-map"
    info_window_parent_selector = ".contacts-map-wrap"
}

if(google_map_selector) {
    initializeGMaps(google_map_selector, info_window_parent_selector)
}