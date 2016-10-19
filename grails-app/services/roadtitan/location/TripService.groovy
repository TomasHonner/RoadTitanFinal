package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class TripService {

    def serviceMethod() {

    }

    def getTrip(Long id)
    {
        return Trip.findById(id)
    }

    def getLocationsFromTrip(long tripId)
    {
        return Trip.findById(tripId).getLocations()
    }
}
