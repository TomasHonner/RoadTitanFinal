
<%@ page import="roadtitan.core.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="company.title2" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="create" action="create"><g:message code="company.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="company.crud.new" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="companyName" title="${message(code: 'company.name')}" />
						<g:sortableColumn property="companyCode" title="${message(code: 'company.code')}" />
						<g:sortableColumn property="companyAddress" title="${message(code: 'company.address')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr>
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "companyName")}</g:link></td>
						<td>${fieldValue(bean: companyInstance, field: "companyCode")}</td>
						<td>${fieldValue(bean: companyInstance, field: "companyAddress")}</td>
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
