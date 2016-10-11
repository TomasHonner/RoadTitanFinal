
<%@ page import="roadtitan.security.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="user.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="user.title2" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="user.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="user.title" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="list-group">
			
				<g:if test="${appUserInstance?.appUserName}">
				<li class=" list-group-item  list-group-item-success list-group-item-heading ">
					<span><g:message code="user.name"/></span>
						<span><g:fieldValue bean="${appUserInstance}" field="appUserName"/></span>
				</li>
				</g:if>

				<g:if test="${appUserInstance?.appUserEmail}">
					<li class="list-group-item">
						<span><g:message code="user.email" /></span>
							<span><g:fieldValue bean="${appUserInstance}" field="appUserEmail"/></span>
					</li>
				</g:if>
			
				<g:if test="${appUserInstance?.appUserAddress}">
				<li class="list-group-item">
					<span><g:message code="user.address" /></span>
						<span><g:fieldValue bean="${appUserInstance}" field="appUserAddress"/></span>
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.company}">
				<li class="list-group-item">
					<span><g:message code="company.title" /></span>
						<span><g:link controller="company" action="show" id="${appUserInstance?.company?.id}">${appUserInstance?.company?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>

				<li class=" list-group-item">
					<span><g:message code="user.enabled"/></span>
					<span><g:formatBoolean boolean="${appUserInstance.secUser.enabled}" false="No" true="Yes"/></span>
				</li>

				<li class=" list-group-item">
					<span><g:message code="user.accExpired"/></span>
					<span><g:formatBoolean boolean="${appUserInstance.secUser.accountExpired}" false="No" true="Yes"/></span>
				</li>

				<li class=" list-group-item">
					<span><g:message code="user.accLocked"/></span>
					<span><g:formatBoolean boolean="${appUserInstance.secUser.accountLocked}" false="No" true="Yes"/></span>
				</li>
			
				%{--<g:if test="${appUserInstance?.secUser}">
				<li class="list-group-item">
					<span id="secUser-label" class="property-label"><g:message code="appUser.secUser.label" default="Sec User" /></span>
						<span class="property-value" aria-labelledby="secUser-label"><g:link controller="secUser" action="show" id="${appUserInstance?.secUser?.id}">${appUserInstance?.secUser?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>--}%
			
			</ul>

			<g:if test="${appUserInstance.secUser.enabled == true}">
				<g:form url="[resource:appUserInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'user.disableAccount')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
			<g:if test="${appUserInstance.secUser.enabled == false}">
				<g:form url="[resource:appUserInstance, action:'enableAccount']" method="PATCH">
					<fieldset class="buttons">
						<g:actionSubmit class="btn btn-lg btn-success" action="enableAccount" value="${message(code: 'user.enableAccount')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>

		</div>
	</body>
</html>
