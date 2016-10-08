package roadtitan.core

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.security.AppUser

class Company {

    String companyName
    String companyCode
    String companyAddress
    static hasMany = [cars: Car, users: AppUser]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        companyName nullable: false, blank: false
        companyCode nullable: true
        companyAddress nullable: true
        cars nullable: true
        users nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'companies'
        companyName column: "company_name"
        companyCode column: "company_code"
        companyAddress column: "company_address"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return companyName
    }
}
