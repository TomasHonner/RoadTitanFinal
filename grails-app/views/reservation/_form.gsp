<%@ page import="roadtitan.reservation.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationStartDate', 'error')} ">
	<label for="reservationStartDate">
		<g:message code="reservation.reservationStartDate.label" default="Reservation Start Date" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationEndDate', 'error')} ">
	<label for="reservationEndDate">
		<g:message code="reservation.reservationEndDate.label" default="Reservation End Date" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationDriverName', 'error')} ">
	<label for="reservationDriverName">
		<g:message code="reservation.reservationDriverName.label" default="Reservation Driver Name" />
		
	</label>
	<g:textField name="reservationDriverName" value="${reservationInstance?.reservationDriverName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationState', 'error')} ">
	<label for="reservationState">
		<g:message code="reservation.reservationState.label" default="Reservation State" />
		
	</label>
	<g:select name="reservationState" from="${enums.ReservationState?.values()}" keys="${enums.ReservationState.values()*.name()}" value="${reservationInstance?.reservationState?.name()}"  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationRejectionReason', 'error')} ">
	<label for="reservationRejectionReason">
		<g:message code="reservation.reservationRejectionReason.label" default="Reservation Rejection Reason" />
		
	</label>
	<g:select name="reservationRejectionReason" from="${enums.RejectionReason?.values()}" keys="${enums.RejectionReason.values()*.name()}" value="${reservationInstance?.reservationRejectionReason?.name()}"  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationWayOfFinancing', 'error')} ">
	<label for="reservationWayOfFinancing">
		<g:message code="reservation.reservationWayOfFinancing.label" default="Reservation Way Of Financing" />
		
	</label>
	<g:select name="reservationWayOfFinancing" from="${enums.WayOfFinancing?.values()}" keys="${enums.WayOfFinancing.values()*.name()}" value="${reservationInstance?.reservationWayOfFinancing?.name()}"  noSelection="['': '']"/>

</div>

