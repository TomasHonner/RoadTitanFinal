<%@ page import="roadtitan.core.Tracker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tracker.crud.edit" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="tracker.title2" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="tracker.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1 class="h1"><g:message code="tracker.crud.edit" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${trackerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${trackerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:trackerInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${trackerInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-lg btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
