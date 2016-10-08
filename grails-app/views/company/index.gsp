
<%@ page import="roadtitan.core.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-company" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="companyName" title="${message(code: 'company.companyName.label', default: 'Company Name')}" />
					
						<g:sortableColumn property="companyCode" title="${message(code: 'company.companyCode.label', default: 'Company Code')}" />
					
						<g:sortableColumn property="companyAddress" title="${message(code: 'company.companyAddress.label', default: 'Company Address')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'company.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'company.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "companyName")}</g:link></td>
					
						<td>${fieldValue(bean: companyInstance, field: "companyCode")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "companyAddress")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "lastUpdated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
