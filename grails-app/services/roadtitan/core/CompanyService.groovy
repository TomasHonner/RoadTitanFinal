package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.security.AppUser
import roadtitan.security.SecUser

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR", "ROLE_USER"])
@Transactional
class CompanyService {

    def serviceMethod() {

    }
}
