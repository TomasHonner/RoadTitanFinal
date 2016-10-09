package roadtitan.security

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional(readOnly = true)
class AppUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppUser.list(params), model:[appUserInstanceCount: AppUser.count()]
    }

    def show(AppUser appUserInstance) {
        respond appUserInstance
    }

    def create() {
        respond new AppUser(params)
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

        appUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appUser.label', default: 'AppUser'), appUserInstance.id])
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AppUser.label', default: 'AppUser'), appUserInstance.id])
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

        appUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AppUser.label', default: 'AppUser'), appUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appUser.label', default: 'AppUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
