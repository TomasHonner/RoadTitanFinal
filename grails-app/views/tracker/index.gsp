
<%@ page import="roadtitan.core.Tracker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tracker.label', default: 'Tracker')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tracker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tracker" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="trackerNumber" title="${message(code: 'tracker.trackerNumber.label', default: 'Tracker Number')}" />
					
						<g:sortableColumn property="trackerName" title="${message(code: 'tracker.trackerName.label', default: 'Tracker Name')}" />
					
						<g:sortableColumn property="trackerGsmMode" title="${message(code: 'tracker.trackerGsmMode.label', default: 'Tracker Gsm Mode')}" />
					
						<g:sortableColumn property="trackerImei" title="${message(code: 'tracker.trackerImei.label', default: 'Tracker Imei')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'tracker.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'tracker.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trackerInstanceList}" status="i" var="trackerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trackerInstance.id}">${fieldValue(bean: trackerInstance, field: "trackerNumber")}</g:link></td>
					
						<td>${fieldValue(bean: trackerInstance, field: "trackerName")}</td>
					
						<td>${fieldValue(bean: trackerInstance, field: "trackerGsmMode")}</td>
					
						<td>${fieldValue(bean: trackerInstance, field: "trackerImei")}</td>
					
						<td>${fieldValue(bean: trackerInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: trackerInstance, field: "lastUpdated")}</td>
					
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
