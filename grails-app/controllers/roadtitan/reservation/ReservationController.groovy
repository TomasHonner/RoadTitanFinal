package roadtitan.reservation

import enums.RejectionReason
import enums.ReservationState
import enums.WayOfFinancing
import grails.plugin.springsecurity.annotation.Secured
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR", "ROLE_USER"])
@Transactional(readOnly = true)
class ReservationController {

    def secService
    def carService
    def reservationService
    def mailService

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
    @Transactional
    def approve()
    {
        Reservation reservation = Reservation.findById(Long.valueOf(params.resId))
        reservation.setReservationState(ReservationState.APPROVED)
        update(reservation)
        mailService.sendMail{
            to reservation.getAppUser().getAppUserEmail()
            subject "reservation was changed"
            body 'Your reservation in RoadTitan App was changed'
        }
        redirect action: "forApproval", method: "GET"
    }

    @Secured(["ROLE_SUPERVISOR", "ROLE_ADMIN"])
    @Transactional
    def reject()
    {
        Reservation reservation = Reservation.findById(Long.valueOf(params.resId))
        reservation.setReservationState(ReservationState.REJECTED)
        reservation.setReservationRejectionReason(RejectionReason.UNSPECIFIED)
        update(reservation)
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
    def preSave(Reservation reservationInstance)
    {
        if (reservationInstance.getReservationState() == null)
        {
            reservationInstance.setReservationState(ReservationState.WAITING_FOR_APPROVAL)
        }

        if (reservationInstance.getReservationWayOfFinancing() == null)
        {
            reservationInstance.setReservationWayOfFinancing(WayOfFinancing.UNSPECIFIED)
        }

        def check = reservationService.checkReservation(reservationInstance)
        if (check[0] == true && check[1] == true && check[2] == true)
        {
            save(reservationInstance)
        }
        else
        {
            StringBuilder msg = new StringBuilder()
            if (check[0] == false)
            {
                msg << "There is another reservation for that car on this time. \n"
            }
            if (check[1] == false)
            {
                msg << "The date is incorrect. You must choose future date.\n"
            }
            if (check[2] == false)
            {
                msg << "The date is incorrect. The start date must be before the end date. \n"
            }

            render view: "errors", model: [error: msg.toString()]
        }
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
        reservationInstance.save(failOnError: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
                redirect reservationInstance
            }
            '*' { respond reservationInstance, [status: CREATED] }
        }
    }

    def edit(Reservation reservationInstance) {
        def resCars = carService.getCurrentCars()
        System.out.print(reservationInstance.getReservationName().toString())
        if (reservationService.checkReservationDate(reservationInstance.getReservationStartDate()))
        {
            render view: "errors", model: [error: message(code: 'reservation.error')]
        }
        else
        {
            respond reservationInstance, model: [resCars: resCars]
        }

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
