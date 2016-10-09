
<%@ page import="roadtitan.core.Tracker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tracker.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="tracker.title2" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="tracker.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="tracker.title" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul>
				<g:if test="${trackerInstance?.trackerNumber}">
				<li class="fieldcontain">
					<span><g:message code="tracker.number" /></span>
						<span><g:fieldValue bean="${trackerInstance}" field="trackerNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerName}">
				<li class="fieldcontain">
					<span><g:message code="tracker.name" /></span>
						<span><g:fieldValue bean="${trackerInstance}" field="trackerName"/></span>
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerGsmMode}">
				<li class="fieldcontain">
					<span><g:message code="tracker.gsmMode" /></span>
						<span><g:fieldValue bean="${trackerInstance}" field="trackerGsmMode"/></span>
				</li>
				</g:if>
			
				<g:if test="${trackerInstance?.trackerImei}">
				<li class="fieldcontain">
					<span><g:message code="tracker.imei" /></span>
						<span><g:fieldValue bean="${trackerInstance}" field="trackerImei"/></span>
				</li>
				</g:if>

				%{--<g:if test="${trackerInstance?.car}">
				<li class="fieldcontain">
					<span><g:message code="tracker.car" /></span>
						<span><g:link controller="car" action="show" id="${trackerInstance?.car?.id}">${trackerInstance?.car?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>--}%
			
			</ul>
			<g:form url="[resource:trackerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${trackerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
