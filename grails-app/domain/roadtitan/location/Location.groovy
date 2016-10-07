package roadtitan.location

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Location {

    Double latitude
    Double longitude
    DateTime timestamp
    static belongsTo = [trip: Trip]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        latitude nullable: false
        longitude nullable: false
        timestamp nullable: false

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'locations'
        latitude column: "latitude"
        longitude column: "longitude"
        timestamp column: "timestamp", type: PersistentDateTime

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime

    }
}
