package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured
import roadtitan.location.LogBook

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional(readOnly = true)
class TrackerController {

    def secService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tracker.findAllByCompany(secService.currentCompany()), model:[trackerInstanceCount: Tracker.count()]
    }

    def show(Tracker trackerInstance) {
        respond trackerInstance
    }

    def create() {
        respond new Tracker(params)
    }


    @Transactional
    def save(Tracker trackerInstance) {
        if (trackerInstance == null) {
            notFound()
            return
        }

        if (trackerInstance.hasErrors()) {
            respond trackerInstance.errors, view:'create'
            return
        }

        trackerInstance.setCompany(secService.currentCompany())
        trackerInstance.save flush:true
        LogBook book = new LogBook(tracker: trackerInstance).save(failOnError: true)
        trackerInstance.setLogBook(book)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tracker.title'), trackerInstance.id])
                redirect trackerInstance
            }
            '*' { respond trackerInstance, [status: CREATED] }
        }
    }

    def edit(Tracker trackerInstance) {
        respond trackerInstance
    }

    @Transactional
    def update(Tracker trackerInstance) {
        if (trackerInstance == null) {
            notFound()
            return
        }

        if (trackerInstance.hasErrors()) {
            respond trackerInstance.errors, view:'edit'
            return
        }

        trackerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tracker.label', default: 'Tracker'), trackerInstance.id])
                redirect trackerInstance
            }
            '*'{ respond trackerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tracker trackerInstance) {

        if (trackerInstance == null) {
            notFound()
            return
        }

        trackerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tracker.label', default: 'Tracker'), trackerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tracker.label', default: 'Tracker'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
