<%--
  Created by IntelliJ IDEA.
  User: Honner Tomáš
  Date: 15.10.2016
  Time: 8:14
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="trip.title2"/></title>
    <g:javascript>
        $(function () {
            $("#picker1").datetimepicker({format: 'YYYY-MM-DD HH:mm'})
            $("#picker2").datetimepicker({format: 'YYYY-MM-DD HH:mm'})
        })
    </g:javascript>
</head>

<body>
<g:render template="form" />
<div>
    <table class="table table-condensed table-hover">
        <thead>
            <tr>
                <th><g:message code="reservation.name"/></th>
                <th><g:message code="reservation.driverName"/></th>
                <th><g:message code="reservation.reservedCar"/></th>
                <th><g:message code="trip.length"/> </th>
                <th><g:message code="trip.authorized"/></th>
                <th><g:message code="logbook.showDeatils"/></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${trips}" var="trip">
                <tr>
                <td>${trip.reservation.reservationName.toString()}</td>
                <td>${trip.reservation.reservationDriverName.toString()}</td>
                <td>${trip.reservation.reservedCar.toString()}</td>
                <td>${trip.tripLength.toString()} km</td>
                <td><g:formatBoolean boolean="${trip.tripAuthorized}" true="Yes" false="No"/></td>
                <td><g:link controller="map" action="tripMap" params="${[tripId: trip.id]}"><g:message code="logbook.showDeatils"/></g:link></td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>
</body>
</html>