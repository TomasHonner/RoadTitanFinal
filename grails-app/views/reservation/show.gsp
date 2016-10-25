
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="reservation.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="reservation.title2" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="reservation.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="reservation.title" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="list-group">

				<g:if test="${reservationInstance?.reservationName}">
					<li class="list-group-item list-group-item-success list-group-item-heading">
						<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.name" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationName"/></span>
					</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationStartDate}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.startDate" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationStartDate"/></span>
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationEndDate}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.endDate" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationEndDate"/></span>
				</li>
				</g:if>

				<g:if test="${reservationInstance?.reservationStartLocation}">
					<li class="list-group-item">
						<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.startLocation" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationStartLocation"/></span>
					</li>
				</g:if>

				<g:if test="${reservationInstance?.reservationEndLocation}">
					<li class="list-group-item">
						<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.endLocation" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationEndLocation"/></span>
					</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationDriverName}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.driverName" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationDriverName"/></span>
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationState}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.state" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationState"/></span>
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationRejectionReason}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.rejectionReason" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationRejectionReason"/></span>
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationWayOfFinancing}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="reservation.wayOfFinancing" /></h4></span>
						<span><g:fieldValue bean="${reservationInstance}" field="reservationWayOfFinancing"/></span>
				</li>
				</g:if>
			</ul>
			<g:form url="[resource:reservationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${reservationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
