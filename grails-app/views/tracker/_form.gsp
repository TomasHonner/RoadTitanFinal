<%@ page import="roadtitan.core.Tracker" %>



<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerNumber', 'error')} list-group-item  list-group-item-success list-group-item-heading ">
	<label for="trackerNumber">
		<g:message code="tracker.number" />
	</label>
	<g:field name="trackerNumber" type="number" value="${trackerInstance.trackerNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerName', 'error')} list-group-item">
	<label for="trackerName">
		<g:message code="tracker.name" />
	</label>
	<g:textField name="trackerName" value="${trackerInstance?.trackerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerGsmMode', 'error')} list-group-item">
	<label for="trackerGsmMode">
		<g:message code="tracker.gsmMode" />
	</label>
	<g:select name="trackerGsmMode" from="${enums.GsmMode?.values()}" keys="${enums.GsmMode.values()*.name()}" value="${trackerInstance?.trackerGsmMode?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerImei', 'error')} list-group-item">
	<label for="trackerImei">
		<g:message code="tracker.imei" />
	</label>
	<g:textField name="trackerImei" value="${trackerInstance?.trackerImei}"/>
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

