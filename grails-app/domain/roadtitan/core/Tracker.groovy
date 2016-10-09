package roadtitan.core

import enums.GsmMode
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Tracker {

    Integer trackerNumber
    String trackerName
    GsmMode trackerGsmMode
    String trackerImei

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        trackerNumber nullable: true, unique: true
        trackerName nullable: true
        trackerGsmMode nullable: true
        trackerImei nullable: true, unique: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'trackers'
        trackerNumber column: "tracker_number"
        trackerName column: "tracker_name"
        trackerGsmMode column: "tracker_gsm_mode"
        trackerImei column: "tracker_imei"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return trackerName
    }
}
