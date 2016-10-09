
<%@ page import="roadtitan.core.Tracker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tracker.title2" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="create" action="create"><g:message code="tracker.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="tracker.title2" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="trackerNumber" title="${message(code: 'tracker.number')}" />
						<g:sortableColumn property="trackerName" title="${message(code: 'tracker.name')}" />
						<g:sortableColumn property="trackerGsmMode" title="${message(code: 'tracker.gsmMode')}" />
						<g:sortableColumn property="trackerImei" title="${message(code: 'tracker.imei')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${trackerInstanceList}" status="i" var="trackerInstance">
					<tr>
						<td><g:link action="show" id="${trackerInstance.id}">${fieldValue(bean: trackerInstance, field: "trackerNumber")}</g:link></td>
						<td>${fieldValue(bean: trackerInstance, field: "trackerName")}</td>
						<td>${fieldValue(bean: trackerInstance, field: "trackerGsmMode")}</td>
						<td>${fieldValue(bean: trackerInstance, field: "trackerImei")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trackerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
