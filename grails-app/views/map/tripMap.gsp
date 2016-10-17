<%--
  Created by IntelliJ IDEA.
  User: Honner Tomáš
  Date: 16.10.2016
  Time: 9:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="map.title"/></title>

    %{--<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgNFK7Z0k60ySZCHnG3J22vTIbEK-SJOg&callback=initializeMap"></script>--}%
    <script src="https://maps.google.com/maps/api/js?sensor=false&libraries=geometry&v=3.22&key=AIzaSyAgNFK7Z0k60ySZCHnG3J22vTIbEK-SJOg"></script>

    <g:javascript>
        var loc = [];
        var maplace;

        var tripId = ${params.tripId};

        function getTripLocations() {
          $.ajax({
             url:"${g.createLink(controller:'map',action: 'getTripLocations')}",
             dataType: 'json',
             data: {
                    tripId: tripId

                    },
                success: function(data) {
                $("#test").html(JSON.stringify(data))

                loc.length = 0;
                for(var i = 0 ; i < data.length; i++)
                {
                    var location = {
                        lat: data[i].latitude,
                        lon: data[i].longitude,
                        //title: "carId: "+data[i].carId,
                        html: data[i].timestamp
                                }

                                loc.push(location);
                            }
                            //alert(JSON.stringify(loc));
                            maplace.SetLocations(loc, true);

                        },
                        error: function(request, status, error) {
                            alert(error)
                        },
                        complete: function() {
                        }
                    });
        }

        $(function() {
             getTripLocations();
        })

        $(function () {
            maplace = new Maplace({
                map_div: '#gmap',
                controls_div: '#mapControls',
                controls_type: 'list',
                type: 'polyline',
                map_options: {
                    set_center: [48.977974, 14.446534],
                    zoom: 10
                }
            }).Load();
        });
    </g:javascript>
</head>

<body>
<div class="row">
    <div id="mapControls"></div>
    <div id="gmap" class="map center"></div>
</div>
</body>
</html>