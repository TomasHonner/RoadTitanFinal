package roadtitan.location

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.reservation.Reservation

class Trip {

    DateTime tripStartDateTime
    DateTime tripEndDateTime
    Integer tripLength
    static hasMany = [locations: Location]
    static belongsTo = [reservation: Reservation]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        tripStartDateTime nullable: true
        tripEndDateTime nullable: true
        tripLength nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'trips'
        tripStartDateTime column: "trip_start_date_time", type: PersistentDateTime
        tripEndDateTime column: "trip_end_date_time", type: PersistentDateTime
        tripLength column: "trip_length"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
}
