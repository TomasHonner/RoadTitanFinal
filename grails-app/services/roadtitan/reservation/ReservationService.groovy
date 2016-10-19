package roadtitan.reservation

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class ReservationService {

    def serviceMethod() {

    }

    def checkReservation()
    {

    }
}
