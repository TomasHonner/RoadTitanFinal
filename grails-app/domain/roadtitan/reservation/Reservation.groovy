package roadtitan.reservation

import enums.RejectionReason
import enums.ReservationState
import enums.WayOfFinancing
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Reservation {

    DateTime reservationStartDate
    DateTime reservationEndDate
    String reservationDriverName
    ReservationState reservationState
    RejectionReason reservationRejectionReason
    WayOfFinancing reservationWayOfFinancing

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        reservationStartDate nullable: true
        reservationEndDate nullable: true
        reservationDriverName nullable: true
        reservationState nullable: true
        reservationRejectionReason nullable: true
        reservationWayOfFinancing nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'reservation'
        reservationStartDate type: PersistentDateTime, column: "reservation_start_date"
        reservationEndDate type: PersistentDateTime, column: "reservation_end_date"
        reservationDriverName column: "reservation_driver_name"
        reservationState column: "reservation_state"
        reservationRejectionReason column: "reservation_rejection_reason"
        reservationWayOfFinancing column: "reservation_way_of_financing"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime

    }
}
