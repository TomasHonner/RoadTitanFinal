<%@ page import="roadtitan.reservation.Reservation" %>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationName', 'error')} list-group-item list-group-item-success list-group-item-heading">
	<label for="reservationName">
		<g:message code="reservation.name" />
	</label>
	<g:textField name="reservationName" value="${reservationInstance?.reservationDriverName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationStartDate', 'error')} list-group-item  list-group-item-success list-group-item-heading">
	<label for="reservationStartDate">
		<g:message code="reservation.startDate" />
	</label>
	<joda:dateTimePicker name="reservationStartDate" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndDate', 'error')} list-group-item">
	<label for="reservationEndDate">
		<g:message code="reservation.endDate" />
	</label>
	<joda:dateTimePicker name="reservationEndDate" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationStartLocation', 'error')} list-group-item">
	<label for="reservationStartLocation">
		<g:message code="reservation.startLocation" />
	</label>
	<g:textField name="reservationStartLocation" value="${reservationInstance?.reservationStartLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndLocation', 'error')} list-group-item">
	<label for="reservationEndLocation">
		<g:message code="reservation.endLocation" />
	</label>
	<g:textField name="reservationEndLocation" value="${reservationInstance?.reservationEndLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndDate', 'error')} list-group-item">
	<label for="reservedCar">
		<g:message code="reservation.reservedCar" />
	</label>
	<g:select id="reservedCar" name="reservedCar.id" from="${resCars}" optionKey="id" value="${carInstance?.reservedCar?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationDriverName', 'error')} list-group-item">
	<label for="reservationDriverName">
		<g:message code="reservation.driverName" />
	</label>
	<g:textField name="reservationDriverName" value="${reservationInstance?.reservationDriverName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationState', 'error')} list-group-item">
	<label for="reservationState">
		<g:message code="reservation.state" />
	</label>
	<g:select name="reservationState" from="${enums.ReservationState?.values()}" keys="${enums.ReservationState.values()*.name()}" value="${reservationInstance?.reservationState?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationRejectionReason', 'error')} list-group-item">
	<label for="reservationRejectionReason">
		<g:message code="reservation.rejectionReason" />
	</label>
	<g:select name="reservationRejectionReason" from="${enums.RejectionReason?.values()}" keys="${enums.RejectionReason.values()*.name()}" value="${reservationInstance?.reservationRejectionReason?.name()}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationWayOfFinancing', 'error')} list-group-item">
	<label for="reservationWayOfFinancing">
		<g:message code="reservation.wayOfFinancing" />
	</label>
	<g:select name="reservationWayOfFinancing" from="${enums.WayOfFinancing?.values()}" keys="${enums.WayOfFinancing.values()*.name()}" value="${reservationInstance?.reservationWayOfFinancing?.name()}"  noSelection="['': '']"/>

</div>

