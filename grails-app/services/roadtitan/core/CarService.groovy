package roadtitan.core

import grails.transaction.Transactional

@Transactional
class CarService {

    def secService

    def serviceMethod() {

    }

    def getCurrentCars(def params)
    {
        return Car.findAllByCompany(secService.currentCompany(), params)
    }

    def getCar(Long id)
    {
        return Car.findById(id)
    }

    def getCarLocation()
    {

    }
}
