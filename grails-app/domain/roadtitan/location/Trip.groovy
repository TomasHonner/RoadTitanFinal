package roadtitan.location

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Trip {

    DateTime tripStartDateTime
    DateTime tripEndDateTime
    Integer tripLength
    static hasMany = [locations: Location]
    static belongsTo = [logBook: LogBook]
    static hasOne = [tripStartLocation: Location, tripEndLocation: Location]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        tripStartDateTime nullable: true
        tripEndDateTime nullable: true
        tripStartLocation nullable: true
        tripEndLocation nullable: true
        tripLength nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'trips'
        tripStartDateTime column: "trip_start_date_time", type: PersistentDateTime
        tripEndDateTime column: "trip_end_date_time", type: PersistentDateTime
        tripStartLocation column: "trip_start_location"
        tripEndLocation column: "trip_start_location"
        tripLength column: "trip_length"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
}
