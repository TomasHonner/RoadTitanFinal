package roadtitan.core

import enums.CarType
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Car {

    String carName
    String carRegistrationNumber
    CarType carCarType
    static belongsTo = [company: Company , tracker: Tracker]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        carName nullable: true
        carRegistrationNumber nullable: true, unique: true
        carCarType nullable: true
        company nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'cars'
        carName column: "car_name"
        carRegistrationNumber column: "car_registration_number"
        carCarType column: "car_type"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return carName
    }
}
