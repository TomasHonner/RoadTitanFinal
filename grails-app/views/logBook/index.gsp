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
    <g:javascript>
        function showLogBook() {
            $.ajax({
                url: "${g.createLink(controller:'logBook',action: 'showLogBook')}",
                dataType: "json",
                method: "GET",
                data: {
                    carId: $("#car").val()
                },
                success: function(data) {
                    $("#pop").html(JSON.stringify(data))
                },
                error: function(request, status, error) {
                    alert(error)
                },
                complete: function() {
                }
            });
        }
    </g:javascript>
</head>

<body>
    <div>
            <g:select id="car" from="${cars}" name="car" value="car.id" optionKey="id" optionValue="carName"/>
            <button id="logSubmit" class="btn btn-primary btn-sm" onclick="showLogBook();"><g:message code="logbook.submitButton"/></button>
    </div>
    <div id="pop"></div>
</body>
</html>