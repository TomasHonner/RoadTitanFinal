
<%@ page import="roadtitan.security.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-appUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-appUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="appUserName" title="${message(code: 'appUser.appUserName.label', default: 'App User Name')}" />
					
						<g:sortableColumn property="appUserAddress" title="${message(code: 'appUser.appUserAddress.label', default: 'App User Address')}" />
					
						<g:sortableColumn property="appUserEmail" title="${message(code: 'appUser.appUserEmail.label', default: 'App User Email')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'appUser.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'appUser.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="appUser.company.label" default="Company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${appUserInstanceList}" status="i" var="appUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${appUserInstance.id}">${fieldValue(bean: appUserInstance, field: "appUserName")}</g:link></td>
					
						<td>${fieldValue(bean: appUserInstance, field: "appUserAddress")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "appUserEmail")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "lastUpdated")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
