
<%@ page import="roadtitan.core.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="app.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="create" action="create"><g:message code="car.crud.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1 class="h1"><g:message code="car.title2" /></h1>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<table class="table table-condensed table-hover">
                <thead>
                        <tr>
                            <g:sortableColumn property="carName" title="${message(code: 'car.name')}" />
                            <g:sortableColumn property="carRegistrationNumber" title="${message(code: 'car.registrationNumber')}" />
                            <g:sortableColumn property="carCarType" title="${message(code: 'car.carType')}" />
                            <th><g:message code="company.title" /></th>
                        </tr>
                </thead>
                <tbody>
                    <g:each in="${carInstanceList}" status="i" var="carInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "carName")}</g:link></td>
                            <td>${fieldValue(bean: carInstance, field: "carRegistrationNumber")}</td>
                            <td>${fieldValue(bean: carInstance, field: "carCarType")}</td>
                            <td>${fieldValue(bean: carInstance, field: "company")}</td>
                        </tr>
                    </g:each>
                </tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
