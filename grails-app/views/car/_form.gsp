<%@ page import="roadtitan.core.Car" %>


<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carName', 'error')} list-group-item  list-group-item-success list-group-item-heading">
	<label for="carName" class="h4 control-label">
		<g:message code="car.name" />:
	</label>
	<g:textField class="form-control" name="carName" value="${carInstance?.carName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carRegistrationNumber', 'error')} list-group-item ">
	<label for="carRegistrationNumber" class="h4 control-label">
		<g:message code="car.registrationNumber" />
	</label>
	<g:textField class="form-control" name="carRegistrationNumber" value="${carInstance?.carRegistrationNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carCarType', 'error')} list-group-item ">
	<label for="carCarType" class="h4 control-label">
		<g:message code="car.carType" />
	</label>
	<g:select class="form-control" name="carCarType" from="${enums.CarType?.values()}" keys="${enums.CarType.values()*.name()}" value="${carInstance?.carCarType?.name()}"  noSelection="['': '']"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'company', 'error')} required list-group-item">
	<label for="company">
		<g:message code="company.title" />:
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${roadtitan.core.Company.list()}" optionKey="id" required="" value="${carInstance?.company?.id}" class="many-to-one"/>

</div>--}%

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'tracker', 'error')} required list-group-item">
	<label for="tracker" class="h4 control-label">
		<g:message code="car.tracker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tracker" name="tracker.id" from="${trackers}" optionKey="id" required="" value="${carInstance?.tracker?.id}" class="many-to-one form-control"/>

</div>

