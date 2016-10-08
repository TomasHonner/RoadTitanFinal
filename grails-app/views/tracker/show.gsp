
<%@ page import="roadtitan.core.Tracker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tracker.label', default: 'Tracker')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tracker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tracker" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tracker">
			
				<g:if test="${trackerInstance?.trackerNumber}">
				<li class="fieldcontain">
					<span id="trackerNumber-label" class="property-label"><g:message code="tracker.trackerNumber.label" default="Tracker Number" /></span>
					
						<span class="property-value" aria-labelledby="trackerNumber-label"><g:fieldValue bean="${trackerInstance}" field="trackerNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerName}">
				<li class="fieldcontain">
					<span id="trackerName-label" class="property-label"><g:message code="tracker.trackerName.label" default="Tracker Name" /></span>
					
						<span class="property-value" aria-labelledby="trackerName-label"><g:fieldValue bean="${trackerInstance}" field="trackerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerGsmMode}">
				<li class="fieldcontain">
					<span id="trackerGsmMode-label" class="property-label"><g:message code="tracker.trackerGsmMode.label" default="Tracker Gsm Mode" /></span>
					
						<span class="property-value" aria-labelledby="trackerGsmMode-label"><g:fieldValue bean="${trackerInstance}" field="trackerGsmMode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerImei}">
				<li class="fieldcontain">
					<span id="trackerImei-label" class="property-label"><g:message code="tracker.trackerImei.label" default="Tracker Imei" /></span>
					
						<span class="property-value" aria-labelledby="trackerImei-label"><g:fieldValue bean="${trackerInstance}" field="trackerImei"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="tracker.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${trackerInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="tracker.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${trackerInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.car}">
				<li class="fieldcontain">
					<span id="car-label" class="property-label"><g:message code="tracker.car.label" default="Car" /></span>
					
						<span class="property-value" aria-labelledby="car-label"><g:link controller="car" action="show" id="${trackerInstance?.car?.id}">${trackerInstance?.car?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:trackerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${trackerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
