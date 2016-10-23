package roadtitan.reservation

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import groovy.sql.Sql
import org.joda.time.DateTime

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class ReservationService {

    def secService

    def serviceMethod() {

    }

    def checkReservation(Reservation reservation)
    {
        boolean rObject, rDate, rTimeLine
        rObject = checkReservationObject(reservation)
        rDate = checkReservationDate(reservation.reservationStartDate, reservation.reservationEndDate)
        rTimeLine = checkReservationTimeLine(reservation.reservationStartDate, reservation.reservationEndDate)
        def result = [rObject, rDate,rTimeLine]
        return result
    }

    def checkReservationObject(Reservation reservation)
    {
        def rCompany = secService.currentCompany()
        def rCar  = reservation.reservedCar
        def sDate = reservation.reservationStartDate
        def eDate = reservation.reservationEndDate

        def listOfReservations = Reservation.find {
            reservationStartDate <= sDate && reservationEndDate >= eDate && company == rCompany && reservedCar == rCar
        }
        System.out.print(listOfReservations)

        if (listOfReservations == null)
        {
            return true
        }
        else return false
    }

    def checkReservationDate(DateTime from, DateTime to)
    {
        boolean r1 = from.isAfterNow()
        boolean r2 = to.isAfterNow()

        if (r1 && r2) return true
        else return false
    }

    def checkReservationTimeLine(DateTime from, DateTime to)
    {
        if (to.isAfter(from)) return true
        else return false
    }

}
