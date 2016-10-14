package roadtitan.location

import roadtitan.core.Tracker

class LogBook {

    static hasMany = [trips: Trip]
    static belongsTo = [tracker: Tracker]

    static constraints = {
    }

    static mapping = {
        table 'logbooks'
    }
}
