
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reservation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.reservationStartDate}">
				<li class="fieldcontain">
					<span id="reservationStartDate-label" class="property-label"><g:message code="reservation.reservationStartDate.label" default="Reservation Start Date" /></span>
					
						<span class="property-value" aria-labelledby="reservationStartDate-label"><g:fieldValue bean="${reservationInstance}" field="reservationStartDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationEndDate}">
				<li class="fieldcontain">
					<span id="reservationEndDate-label" class="property-label"><g:message code="reservation.reservationEndDate.label" default="Reservation End Date" /></span>
					
						<span class="property-value" aria-labelledby="reservationEndDate-label"><g:fieldValue bean="${reservationInstance}" field="reservationEndDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationDriverName}">
				<li class="fieldcontain">
					<span id="reservationDriverName-label" class="property-label"><g:message code="reservation.reservationDriverName.label" default="Reservation Driver Name" /></span>
					
						<span class="property-value" aria-labelledby="reservationDriverName-label"><g:fieldValue bean="${reservationInstance}" field="reservationDriverName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationState}">
				<li class="fieldcontain">
					<span id="reservationState-label" class="property-label"><g:message code="reservation.reservationState.label" default="Reservation State" /></span>
					
						<span class="property-value" aria-labelledby="reservationState-label"><g:fieldValue bean="${reservationInstance}" field="reservationState"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationRejectionReason}">
				<li class="fieldcontain">
					<span id="reservationRejectionReason-label" class="property-label"><g:message code="reservation.reservationRejectionReason.label" default="Reservation Rejection Reason" /></span>
					
						<span class="property-value" aria-labelledby="reservationRejectionReason-label"><g:fieldValue bean="${reservationInstance}" field="reservationRejectionReason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationWayOfFinancing}">
				<li class="fieldcontain">
					<span id="reservationWayOfFinancing-label" class="property-label"><g:message code="reservation.reservationWayOfFinancing.label" default="Reservation Way Of Financing" /></span>
					
						<span class="property-value" aria-labelledby="reservationWayOfFinancing-label"><g:fieldValue bean="${reservationInstance}" field="reservationWayOfFinancing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="reservation.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${reservationInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="reservation.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${reservationInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reservationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
