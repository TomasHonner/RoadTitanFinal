
<%@ page import="roadtitan.core.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-company" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list company">
			
				<g:if test="${companyInstance?.companyName}">
				<li class="fieldcontain">
					<span id="companyName-label" class="property-label"><g:message code="company.companyName.label" default="Company Name" /></span>
					
						<span class="property-value" aria-labelledby="companyName-label"><g:fieldValue bean="${companyInstance}" field="companyName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.companyCode}">
				<li class="fieldcontain">
					<span id="companyCode-label" class="property-label"><g:message code="company.companyCode.label" default="Company Code" /></span>
					
						<span class="property-value" aria-labelledby="companyCode-label"><g:fieldValue bean="${companyInstance}" field="companyCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.companyAddress}">
				<li class="fieldcontain">
					<span id="companyAddress-label" class="property-label"><g:message code="company.companyAddress.label" default="Company Address" /></span>
					
						<span class="property-value" aria-labelledby="companyAddress-label"><g:fieldValue bean="${companyInstance}" field="companyAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.cars}">
				<li class="fieldcontain">
					<span id="cars-label" class="property-label"><g:message code="company.cars.label" default="Cars" /></span>
					
						<g:each in="${companyInstance.cars}" var="c">
						<span class="property-value" aria-labelledby="cars-label"><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="company.users.label" default="Users" /></span>
					
						<g:each in="${companyInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="appUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="company.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${companyInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="company.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${companyInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:companyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${companyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
