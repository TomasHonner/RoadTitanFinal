package roadtitan.location

import roadtitan.core.Company

class LogBook {

    static hasMany = [trips: Trip]
    static belongsTo = [company: Company]

    static constraints = {
    }
}
