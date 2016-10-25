<%@ page import="org.joda.time.LocalDate" %>

<div class="marginTop marginBottom">
    <div id="filter">
        <div class="row">
            <g:form action="filteredListUserDate" name="filterForm" class="form-group">
            <span id="selectDate">
                <span class="col-md-4 col-md-offset-2">
                    <label class="h4 control-label"><g:message code="logbook.filter.from"/></label>
                    <div class="form-group">
                    <div class="input-group date" id="picker1">
                        <input id="dateFrom" name="dateFrom" type="text" class="form-control"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    </div>
                </span>
                <span class="col-md-4">
                    <label class="control-label h4"><g:message code="logbook.filter.to"/></label>
                    <div class="input-group date" id="picker2">
                        <input id="dateTo" name="dateTo" type="text" class="form-control"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </span>
            </span>
            <sec:ifAllGranted roles="ROLE_SUPERVISOR">
            <span id="userSelect" class="col-md-8 col-md-offset-2">
                <label class="h4 control-label"><g:message code="user.title"/></label>
                <g:select id="user" class="form-control" from="${users}" name="user" optionKey="id" value="user.appUserName" />
            </span>
            </sec:ifAllGranted>
            <span class="col-md-2 col-md-offset-5 paddingTop marginBottom">
                <g:actionSubmit value="Filter" class="btn btn-primary" action="filteredListUserDate"/>
            </span>
            </g:form>
        </div>
    </div>
</div>