<%@ page import="roadtitan.reservation.Reservation" %>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationName', 'error')} list-group-item list-group-item-success list-group-item-heading">
	<label for="reservationName" class="h4 control-label">
		<g:message code="reservation.name" />
	</label>
	<g:textField class="form-control" name="reservationName" value="${reservationInstance?.reservationDriverName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationStartDate', 'error')} list-group-item">
	<label for="reservationStartDate" class="h4 control-label">
		<g:message code="reservation.startDate" />
	</label>
	<joda:dateTimePicker name="reservationStartDate" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
	%{--<div class='input-group date' id='datetimepicker1'>
		<input type='text' class="form-control" name="reservationStartDate" />
		<span class="input-group-addon">
			<span class="glyphicon glyphicon-calendar"></span>
		</span>
	</div>--}%
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndDate', 'error')} list-group-item">
	<label for="reservationEndDate" class="h4 control-label">
		<g:message code="reservation.endDate" />
	</label>
	<joda:dateTimePicker name="reservationEndDate" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
	%{--<div class='input-group date' id='datetimepicker2'>
		<input type='text' class="form-control" name="reservationEndDate" />
		<span class="input-group-addon">
			<span class="glyphicon glyphicon-calendar"></span>
		</span>
	</div>--}%
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationStartLocation', 'error')} list-group-item">
	<label for="reservationStartLocation" class="h4 control-label">
		<g:message code="reservation.startLocation" />
	</label>
	<g:textField class="form-control" name="reservationStartLocation" value="${reservationInstance?.reservationStartLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndLocation', 'error')} list-group-item">
	<label for="reservationEndLocation" class="h4 control-label">
		<g:message code="reservation.endLocation" />
	</label>
	<g:textField class="form-control" name="reservationEndLocation" value="${reservationInstance?.reservationEndLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndDate', 'error')} list-group-item">
	<label for="reservedCar" class="h4 control-label">
		<g:message code="reservation.reservedCar" />
	</label>
	<g:select id="reservedCar" class="form-control" name="reservedCar.id" from="${resCars}" optionKey="id" value="${carInstance?.reservedCar?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationDriverName', 'error')} list-group-item">
	<label for="reservationDriverName" class="h4 control-label">
		<g:message code="reservation.driverName" />
	</label>
	<g:textField class="form-control" name="reservationDriverName" value="${reservationInstance?.reservationDriverName}"/>

</div>

<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SUPERVISOR">

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationState', 'error')} list-group-item">
	<label for="reservationState" class="h4 control-label">
		<g:message code="reservation.state" />
	</label>
	<g:select class="form-control" name="reservationState" from="${enums.ReservationState?.values()}" keys="${enums.ReservationState.values()*.name()}" value="${reservationInstance?.reservationState?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationRejectionReason', 'error')} list-group-item">
	<label for="reservationRejectionReason" class="h4 control-label">
		<g:message code="reservation.rejectionReason" />
	</label>
	<g:select class="form-control" name="reservationRejectionReason" from="${enums.RejectionReason?.values()}" keys="${enums.RejectionReason.values()*.name()}" value="${reservationInstance?.reservationRejectionReason?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationWayOfFinancing', 'error')} list-group-item">
	<label for="reservationWayOfFinancing" class="h4 control-label">
		<g:message code="reservation.wayOfFinancing" />
	</label>
	<g:select class="form-control" name="reservationWayOfFinancing" from="${enums.WayOfFinancing?.values()}" keys="${enums.WayOfFinancing.values()*.name()}" value="${reservationInstance?.reservationWayOfFinancing?.name()}"  noSelection="['': '']"/>

</div>

</sec:ifAnyGranted>

