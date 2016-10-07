package roadtitan.core

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Company {

    String companyName
    String companyCode
    static hasMany = [cars: Car]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        companyName nullable: false, blank: false
        companyCode nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'companies'
        companyName column: "company_name"
        companyCode column: "company_code"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
}
