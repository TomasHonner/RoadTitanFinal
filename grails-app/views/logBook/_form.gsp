<%@ page import="org.joda.time.LocalDate" %>

<div class="marginTop marginBottom">
    <div id="filter">
        <div class="row">
            <span id="selectDate" class="col-sm-4">
                <g:form action="filteredListUserDate" name="filterForm">
                    <label><g:message code="logbook.filter.from"/></label>
                    <input id="dateFrom" name="dateFrom" type="date"/>
                    <label><g:message code="logbook.filter.to"/></label>
                    <input id="dateTo" name="dateTo" type="date"/>
            </span>
            <sec:ifAllGranted roles="ROLE_SUPERVISOR">
            <span id="userSelect" class="col-sm-2">
                    <g:select id="user" from="${users}" name="user" optionKey="id" value="user.appUserName" />

            </span>
            </sec:ifAllGranted>
                    <g:actionSubmit value="Filter" class="btn btn-sm btn-primary"/>
                </g:form>
        </div>
    </div>
</div>