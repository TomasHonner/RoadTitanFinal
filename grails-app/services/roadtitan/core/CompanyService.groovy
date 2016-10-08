package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.security.AppUser
import roadtitan.security.SecUser

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR", "ROLE_USER"])
@Transactional
class CompanyService {

    def springSecurityService

    def serviceMethod() {

    }

    def currentCompany()
    {
        def secUser = (SecUser) springSecurityService.currentUser
        def appUser = AppUser.findBySecUser(secUser)

        return appUser.company
    }
}
