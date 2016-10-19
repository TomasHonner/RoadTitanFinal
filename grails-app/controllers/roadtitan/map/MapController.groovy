package roadtitan.map

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class MapController {

    static allowedMethods = [getTripLocations: 'GET', index: 'GET', tripMap: 'GET', carMap: 'GET', getCarLocation: 'GET']

    def tripService

    def index() {

    }

    def tripMap()
    {
        Long tripId = Long.valueOf(params.tripId)
        return [tripId: tripId]
    }

    def carMap()
    {
        Long carId = Long.valueOf(params.carId)
        return [carId: carId]
    }

    def getTripLocations()
    {
        Long tripId = Long.valueOf(params.tripId)
        System.out.print(tripId)
        render tripService.getLocationsFromTrip(tripId) as JSON
    }

    def getCarLocation()
    {

    }
}
