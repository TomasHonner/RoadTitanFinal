package roadtitan.reservation

import enums.RejectionReason
import enums.ReservationState
import grails.plugin.springsecurity.annotation.Secured
import roadtitan.core.Car

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR", "ROLE_USER"])
@Transactional(readOnly = true)
class ReservationController {

    def secService
    def carService
    def reservationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reservation.findAllByCompany(secService.currentCompany(), params), model:[reservationInstanceCount: Reservation.countByCompany(secService.currentCompany())]
    }

    @Secured(["ROLE_SUPERVISOR", "ROLE_ADMIN"])
    def forApproval(Integer max)
    {
        params.max = Math.min(max ?: 10, 100)
        respond Reservation.findAllByReservationStateAndCompany(ReservationState.WAITING_FOR_APPROVAL, secService.currentCompany(), params), model:[reservationInstanceCount: Reservation.countByReservationStateAndCompany(ReservationState.WAITING_FOR_APPROVAL, secService.currentCompany())]
    }

    @Secured(["ROLE_SUPERVISOR", "ROLE_ADMIN"])
    def approved()
    {
        Reservation reservation = Reservation.findById(Long.valueOf(params.resId))
        System.out.print(reservation)
        reservation.setReservationState(ReservationState.APPROVED)
        reservation.save(failOnError: true, flush: true)
        redirect action: "forApproval", method: "GET"
    }

    def show(Reservation reservationInstance) {
        respond reservationInstance
    }

    def create() {
        def resCars = carService.getCurrentCars()
        respond new Reservation(params), model: [resCars: resCars]
    }

    @Transactional
    def save(Reservation reservationInstance) {
        if (reservationInstance == null) {
            notFound()
            return
        }

        if (reservationInstance.hasErrors()) {
            respond reservationInstance.errors, view:'create'
            return
        }


        reservationInstance.setCompany(secService.currentCompany())
        reservationInstance.setAppUser(secService.currentAppUser())
        reservationService.checkReservation(reservationInstance)

        reservationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect reservationInstance
            }
            '*' { respond reservationInstance, [status: CREATED] }
        }
    }

    def edit(Reservation reservationInstance) {
        respond reservationInstance
    }

    @Transactional
    def update(Reservation reservationInstance) {
        if (reservationInstance == null) {
            notFound()
            return
        }

        if (reservationInstance.hasErrors()) {
            respond reservationInstance.errors, view:'edit'
            return
        }

        reservationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect reservationInstance
            }
            '*'{ respond reservationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reservation reservationInstance) {

        if (reservationInstance == null) {
            notFound()
            return
        }

        reservationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
