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
        return [cars: cars]
    }

    def show()
    {
        Long carId = Long.valueOf(params.car)
        Car car = carService.getCar(carId)
        LogBook book = car.tracker.getLogBook()
        def trips = book.getTrips()
        return [trips: trips]
    }

    def showLogBook(){
        Long carId = Long.valueOf(params.carId)
        Car car = carService.getCar(carId)
        LogBook book = car.tracker.getLogBook()
        def trips = book.getTrips()
        render trips as JSON

    }

    def item(){
    }
}
