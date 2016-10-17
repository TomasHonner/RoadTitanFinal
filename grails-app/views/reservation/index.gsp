
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="reservation.title2" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="create" action="create"><g:message code="reservation.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="reservation.title2" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="reservationName" title="${message(code:'reservation.name')}" />
						<g:sortableColumn property="reservationStartDate" title="${message(code: 'reservation.startDate')}" />
						<g:sortableColumn property="reservationEndDate" title="${message(code: 'reservation.endDate')}" />
						<g:sortableColumn property="reservationStartLocation" title="${message(code: 'reservation.startLocation')}" />
						<g:sortableColumn property="reservationEndLocation" title="${message(code: 'reservation.endLocation')}" />
						<g:sortableColumn property="reservationDriverName" title="${message(code: 'reservation.driverName')}" />
						<g:sortableColumn property="reservationState" title="${message(code: 'reservation.state')}" />
						<g:sortableColumn property="reservationRejectionReason" title="${message(code: 'reservation.rejectionReason')}" />
						<g:sortableColumn property="reservationWayOfFinancing" title="${message(code: 'reservation.wayOfFinancing')}" />
						<g:sortableColumn property="appUser" title="${message(code: 'user.title')}" />
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
