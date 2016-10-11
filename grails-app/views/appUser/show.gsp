
<%@ page import="roadtitan.security.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appUser">
			
				<g:if test="${appUserInstance?.appUserName}">
				<li class="fieldcontain">
					<span id="appUserName-label" class="property-label"><g:message code="appUser.appUserName.label" default="App User Name" /></span>
					
						<span class="property-value" aria-labelledby="appUserName-label"><g:fieldValue bean="${appUserInstance}" field="appUserName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.appUserAddress}">
				<li class="fieldcontain">
					<span id="appUserAddress-label" class="property-label"><g:message code="appUser.appUserAddress.label" default="App User Address" /></span>
					
						<span class="property-value" aria-labelledby="appUserAddress-label"><g:fieldValue bean="${appUserInstance}" field="appUserAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.appUserEmail}">
				<li class="fieldcontain">
					<span id="appUserEmail-label" class="property-label"><g:message code="appUser.appUserEmail.label" default="App User Email" /></span>
					
						<span class="property-value" aria-labelledby="appUserEmail-label"><g:fieldValue bean="${appUserInstance}" field="appUserEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="appUser.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${appUserInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="appUser.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${appUserInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="appUser.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${appUserInstance?.company?.id}">${appUserInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.secUser}">
				<li class="fieldcontain">
					<span id="secUser-label" class="property-label"><g:message code="appUser.secUser.label" default="Sec User" /></span>
					
						<span class="property-value" aria-labelledby="secUser-label"><g:link controller="secUser" action="show" id="${appUserInstance?.secUser?.id}">${appUserInstance?.secUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:appUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${appUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
