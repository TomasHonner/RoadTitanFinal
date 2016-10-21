package roadtitan.security

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR", "ROLE_USER"])
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

    def allCurrentCompanyUsers()
    {
        return AppUser.findAllByCompany(currentCompany())
    }

    def currentSecUser()
    {
        def secUser = (SecUser) springSecurityService.currentUser

        return secUser
    }

    def currentUserRole()
    {
        def secUser = (SecUser) springSecurityService.currentUser

        return secUser.getAuthorities()
    }

    def getAppUser(Long id)
    {
        return AppUser.findById(id)
    }
}
