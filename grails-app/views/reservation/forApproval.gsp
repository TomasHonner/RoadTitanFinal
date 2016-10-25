
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="reservation.forApproval" /></title>
</head>
<body>
<div class="nav" role="navigation">
    <ul class="nav nav-tabs">
        <li><g:link class="list" action="index"><g:message code="reservation.title2" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="reservation.crud.new" /></g:link></li>
    </ul>
</div>
<div>
    <h1 class="h1"><g:message code="reservation.forApproval" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-condensed table-condensed">
        <thead>
        <tr>
            <g:sortableColumn property="reservationName" title="${message(code:'reservation.name')}" />
            <g:sortableColumn property="reservationStartDate" title="${message(code: 'reservation.startDate')}" />
            <g:sortableColumn property="reservationEndDate" title="${message(code: 'reservation.endDate')}" />
            <g:sortableColumn property="reservationStartLocation" title="${message(code: 'reservation.startLocation')}" />
            <g:sortableColumn property="reservationEndLocation" title="${message(code: 'reservation.endLocation')}" />
            <g:sortableColumn property="reservationDriverName" title="${message(code: 'reservation.driverName')}" />
            <g:sortableColumn property="reservationState" title="${message(code: 'reservation.state')}" />
            <g:sortableColumn property="appUser" title="${message(code: 'user.title')}" />
            <th><g:message code="app.actions"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
            <tr>
                <td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "reservationName")}</g:link></td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationStartDate")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationEndDate")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationStartLocation")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationEndLocation")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationDriverName")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationState")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationRejectionReason")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "reservationWayOfFinancing")}</td>
                <td>${fieldValue(bean: reservationInstance, field: "appUser")}</td>
                <td>
                    <g:link controller="reservation" action="approve" class="btn btn-sm btn-success" params="${[resId: reservationInstance.id]}"><g:message code="reservation.approve" /></g:link>
                    <g:link controller="reservation" action="reject" class="btn btn-sm btn-danger" params="${[resId: reservationInstance.id]}"><g:message code="reservation.reject" /></g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${reservationInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>