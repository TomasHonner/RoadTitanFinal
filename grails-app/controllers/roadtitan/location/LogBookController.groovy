package roadtitan.location

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.core.Car

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional(readOnly = true)
class LogBookController {

    def carService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def cars = carService.getCurrentCars()
        System.out.print("XXXXXXXXXXXXXXX "+cars.toString())
        [cars: cars]
    }

    def showLogBook(){
        Long carId = Long.valueOf(params.carId)
        Car car = carService.getCar(carId)
        LogBook book = car.tracker.getLogBook()
        def trips = book.getTrips()
        /*trips.each {
            locations = null
        }*/
        render trips as JSON

    }

    def item(){
    }
}
