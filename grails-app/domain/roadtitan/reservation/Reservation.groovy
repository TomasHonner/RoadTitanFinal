package roadtitan.reservation

import enums.RejectionReason
import enums.ReservationState
import enums.WayOfFinancing
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.core.Car
import roadtitan.core.Company
import roadtitan.security.AppUser

class Reservation {

    String reservationName
    DateTime reservationStartDate
    DateTime reservationEndDate
    String reservationDriverName
    ReservationState reservationState
    RejectionReason reservationRejectionReason
    WayOfFinancing reservationWayOfFinancing
    static belongsTo = [company: Company, appUser: AppUser, reservedCar: Car]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        reservationName nullable: false, blank: false
        reservationStartDate nullable: true
        reservationEndDate nullable: true
        reservationDriverName nullable: true
        reservationState nullable: true
        reservationRejectionReason nullable: true
        reservationWayOfFinancing nullable: true
        company nullable: true
        appUser nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'reservation'
        reservationName column: "reservation_name"
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
