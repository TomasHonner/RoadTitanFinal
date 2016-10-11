package roadtitan.security

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional
class SecService {

    def springSecurityService

    def serviceMethod() {

    }

    def currentCompany()
    {
        def secUser = (SecUser) springSecurityService.currentUser
        def appUser = AppUser.findBySecUser(secUser)

        return appUser.company
    }

    def currentAppUser()
    {
        def secUser = (SecUser) springSecurityService.currentUser
        def appUser = AppUser.findBySecUser(secUser)

        return appUser
    }

    def currentSecUser()
    {
        def secUser = (SecUser) springSecurityService.currentUser

        return secUser
    }
}
