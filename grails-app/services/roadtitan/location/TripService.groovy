package roadtitan.location

import grails.transaction.Transactional

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
