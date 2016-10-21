package roadtitan.reservation

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import groovy.sql.Sql
import org.joda.time.DateTime

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class ReservationService {

    def secService
    def dataSource

    def serviceMethod() {

    }

    def checkReservation(Reservation reservation)
    {
        def companyId = secService.currentCompany().id
        def carId  = reservation.reservedCar.id
        def date = reservation.reservationStartDate
        def params = [companyId, carId , date]
        def sql = new Sql(dataSource)
        def result = sql.firstRow('SELECT COUNT (*) as cont from reservations')
        long count = result.cont
        System.out.print(count)


    }
}
