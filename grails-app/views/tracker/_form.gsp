<%@ page import="roadtitan.core.Tracker" %>



<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerNumber', 'error')} ">
	<label for="trackerNumber">
		<g:message code="tracker.trackerNumber.label" default="Tracker Number" />
		
	</label>
	<g:field name="trackerNumber" type="number" value="${trackerInstance.trackerNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerName', 'error')} ">
	<label for="trackerName">
		<g:message code="tracker.trackerName.label" default="Tracker Name" />
		
	</label>
	<g:textField name="trackerName" value="${trackerInstance?.trackerName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerGsmMode', 'error')} ">
	<label for="trackerGsmMode">
		<g:message code="tracker.trackerGsmMode.label" default="Tracker Gsm Mode" />
		
	</label>
	<g:select name="trackerGsmMode" from="${enums.GsmMode?.values()}" keys="${enums.GsmMode.values()*.name()}" value="${trackerInstance?.trackerGsmMode?.name()}"  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'trackerImei', 'error')} ">
	<label for="trackerImei">
		<g:message code="tracker.trackerImei.label" default="Tracker Imei" />
		
	</label>
	<g:textField name="trackerImei" value="${trackerInstance?.trackerImei}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackerInstance, field: 'car', 'error')} required">
	<label for="car">
		<g:message code="tracker.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="car" name="car.id" from="${roadtitan.core.Car.list()}" optionKey="id" required="" value="${trackerInstance?.car?.id}" class="many-to-one"/>

</div>

