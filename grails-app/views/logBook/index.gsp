<%--
  Created by IntelliJ IDEA.
  User: Honner Tomáš
  Date: 13.10.2016
  Time: 10:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="logbook.title"/></title>
</head>

<body>
    <div>
        <h1><g:message code="logbook.title2" /></h1>
        <g:form name="selectCar" url="[action: 'show', controller: 'logBook']">
            <g:select class="form-control center marginBottom" id="carId" from="${cars}" name="car" value="car.id" optionKey="id" optionValue="carName"/>
            <g:submitButton id="carSelectButton" class="btn btn-lg btn-primary col-md-2 col-md-offset-5" name="showLogbook" value="${message(code: 'logbook.submitButton')}"/>
        </g:form>
    </div>
    <div id="pop"></div>
</body>
</html>