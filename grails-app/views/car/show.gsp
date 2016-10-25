
<%@ page import="roadtitan.core.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="car.title2" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="car.title2" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="car.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1 class="h1"><g:message code="car.title" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="list-group">
			
				<g:if test="${carInstance?.carName}">
				<li class="list-group-item list-group-item-heading list-group-item-success">
					<span><h4 class="h4 list-group-item-heading"><g:message code="car.name" /></h4></span
						<span><g:fieldValue bean="${carInstance}" field="carName"/></span
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carRegistrationNumber}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="car.registrationNumber" /></h4></span>
						<span><g:fieldValue bean="${carInstance}" field="carRegistrationNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carCarType}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="car.carType" /></h4></span>
						<span class="property-value" aria-labelledby="carCarType-label"><g:fieldValue bean="${carInstance}" field="carCarType"/></span>
				</li>
				</g:if>
			
				<g:if test="${carInstance?.company}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="company.title" /></h4></span>
						<span><g:link controller="company" action="show" id="${carInstance?.company?.id}">${carInstance?.company?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${carInstance?.tracker}">
				<li class="list-group-item">
					<span><h4 class="h4 list-group-item-heading"><g:message code="car.tracker" /></h4></span>
						<span><g:link controller="tracker" action="show" id="${carInstance?.tracker?.id}">${carInstance?.tracker?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
