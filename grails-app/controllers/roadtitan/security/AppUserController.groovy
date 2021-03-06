package roadtitan.security

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional(readOnly = true)
class AppUserController {

    def secService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        String currentUserRole = secService.currentUserRole().toString()
        currentUserRole = currentUserRole.replace("[ROLE_", "")
        currentUserRole = currentUserRole.replace("]", "")
        System.out.print(currentUserRole)
        if(currentUserRole == "ADMIN")
        {
            respond AppUser.list(params), model:[appUserInstanceCount: AppUser.count()]
        }
        else
        {
            respond AppUser.findAllByCompany(secService.currentCompany(), params), model:[appUserInstanceCount: AppUser.count()]
        }

    }

    def show(AppUser appUserInstance) {
        respond appUserInstance
    }

    def create() {
        respond new AppUser(params)
    }

    @Transactional
    def preSave(AppUser appUserInstance)
    {
        if (SpringSecurityUtils.ifAllGranted("ROLE_SUPERVISOR"))
        {
            appUserInstance.setCompany(secService.currentCompany())
        }

        save(appUserInstance)
    }

    @Transactional
    def save(AppUser appUserInstance) {

        if (appUserInstance == null) {
            notFound()
            return
        }

        if (appUserInstance.hasErrors()) {
            respond appUserInstance.errors, view:'create'
            return
        }

        String privileges = ""
        if (params.role == "1") privileges = "ROLE_USER"
        if (params.role == "2") privileges = "ROLE_SUPERVISOR"
        if (params.role == "3") privileges = "ROLE_ADMIN"


        System.out.print(secService.currentCompany())

        SecRole role = SecRole.findByAuthority(privileges)
        SecUser user = new SecUser(username: params.appUserName, password: params.appUserPassword).save(failOnError: true)
        if (!user.authorities.contains(role))
        {
            SecUserSecRole.create user, role
        }

        appUserInstance.setSecUser(user)
        appUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.title', default: 'AppUser'), appUserInstance.id])
                redirect appUserInstance
            }
            '*' { respond appUserInstance, [status: CREATED] }
        }
    }

    def edit(AppUser appUserInstance) {
        respond appUserInstance
    }

    @Transactional
    def update(AppUser appUserInstance) {
        if (appUserInstance == null) {
            notFound()
            return
        }

        if (appUserInstance.hasErrors()) {
            respond appUserInstance.errors, view:'edit'
            return
        }

        appUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: '', args: [message(code: 'user.title'), appUserInstance.id])
                redirect appUserInstance
            }
            '*'{ respond appUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AppUser appUserInstance) {

        if (appUserInstance == null) {
            notFound()
            return
        }

        appUserInstance.secUser.setEnabled(false)
        //appUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'user.accDisabled', args: [message(code: 'user.title'), appUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.title'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def enableAccount(AppUser appUserInstance)
    {
        if (appUserInstance == null) {
            notFound()
            return
        }

        appUserInstance.secUser.setEnabled(true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'user.accEnabled', args: [message(code: 'user.title'), appUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}
