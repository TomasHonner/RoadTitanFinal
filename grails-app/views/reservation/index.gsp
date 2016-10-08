
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="reservationStartDate" title="${message(code: 'reservation.reservationStartDate.label', default: 'Reservation Start Date')}" />
					
						<g:sortableColumn property="reservationEndDate" title="${message(code: 'reservation.reservationEndDate.label', default: 'Reservation End Date')}" />
					
						<g:sortableColumn property="reservationDriverName" title="${message(code: 'reservation.reservationDriverName.label', default: 'Reservation Driver Name')}" />
					
						<g:sortableColumn property="reservationState" title="${message(code: 'reservation.reservationState.label', default: 'Reservation State')}" />
					
						<g:sortableColumn property="reservationRejectionReason" title="${message(code: 'reservation.reservationRejectionReason.label', default: 'Reservation Rejection Reason')}" />
					
						<g:sortableColumn property="reservationWayOfFinancing" title="${message(code: 'reservation.reservationWayOfFinancing.label', default: 'Reservation Way Of Financing')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "reservationStartDate")}</g:link></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationEndDate")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationDriverName")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationState")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationRejectionReason")}</td>
					
						<td>${fieldValue(bean: reservationInstance, field: "reservationWayOfFinancing")}</td>
					
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
