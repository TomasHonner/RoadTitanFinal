package roadtitan.location

import roadtitan.core.Tracker

class LogBook {

    static hasMany = [trips: Trip]
    static belongsTo = [tracker: Tracker]

    static constraints = {
        trips nullable: true
        tracker nullable: true
    }

    static mapping = {
        table 'logbooks'
    }
}
