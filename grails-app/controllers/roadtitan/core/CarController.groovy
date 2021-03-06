package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional(readOnly = true)
class CarController {

    def secService
    def carService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond carService.getCurrentCars(params), model:[carInstanceCount: Car.count()]
    }

    def show(Car carInstance) {
        respond carInstance
    }

    def create() {
        def trackers = Tracker.findAllByTrackerAssigned(false)
        respond new Car(params), model: [trackers: trackers]
    }

    @Transactional
    def save(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'create'
            return
        }

        carInstance.setCompany(secService.currentCompany())
        carInstance.tracker.setTrackerAssigned(true)
        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*' { respond carInstance, [status: CREATED] }
        }
    }

    def edit(Car carInstance) {
        def trackers = Tracker.findAllByTrackerAssigned(false)
        trackers.add(carInstance.getTracker())
        respond carInstance, model: [trackers: trackers]
    }

    @Transactional
    def update(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'edit'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*'{ respond carInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Car carInstance) {

        if (carInstance == null) {
            notFound()
            return
        }

        carInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
