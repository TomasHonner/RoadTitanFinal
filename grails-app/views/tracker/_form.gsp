<%@ page import="roadtitan.core.Tracker" %>



<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerNumber', 'error')} list-group-item  list-group-item-success list-group-item-heading ">
	<label for="trackerNumber" class="h4 control-label">
		<g:message code="tracker.number" />
	</label>
	<g:field class="form-control" name="trackerNumber" type="number" value="${trackerInstance.trackerNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerName', 'error')} list-group-item">
	<label for="trackerName" class="h4 control-label">
		<g:message code="tracker.name" />
	</label>
	<g:textField class="form-control" name="trackerName" value="${trackerInstance?.trackerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerGsmMode', 'error')} list-group-item">
	<label for="trackerGsmMode" class="h4 control-label">
		<g:message code="tracker.gsmMode" />
	</label>
	<g:select class="form-control" name="trackerGsmMode" from="${enums.GsmMode?.values()}" keys="${enums.GsmMode.values()*.name()}" value="${trackerInstance?.trackerGsmMode?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerImei', 'error')} list-group-item">
	<label for="trackerImei" class="h4 control-label">
		<g:message code="tracker.imei" />
	</label>
	<g:textField class="form-control" name="trackerImei" value="${trackerInstance?.trackerImei}"/>
</div>

%{--
<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'car', 'error')} required list-group-item">
	<label for="car">
		<g:message code="tracker.car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="car" name="car.id" from="${roadtitan.core.Car.list()}" optionKey="id" required="" value="${trackerInstance?.car?.id}" class="many-to-one"/>

</div>
--}%

