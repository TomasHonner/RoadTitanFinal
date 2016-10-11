package roadtitan.security

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.core.Company

class AppUser {

    String appUserName
    String appUserAddress
    String appUserEmail
    String appUserPassword
    static hasOne = [company: Company] //secUser: SecUser,
    static belongsTo = [secUser: SecUser]

    DateTime dateCreated
    DateTime lastUpdated


    static constraints = {
        appUserName nullable: false, blank: false, unique: true
        appUserAddress nullable: true
        appUserEmail nullable: false, blank: false, email: true
        appUserPassword nullable: false, blank: false, password: true
        secUser nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'app_users'
        appUserName column: "app_user_name"
        appUserAddress column: "app_user_address"
        appUserEmail column: "app_user_email"
        appUserPassword column: "app_user_password"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return appUserName
    }
}
