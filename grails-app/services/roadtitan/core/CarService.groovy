package roadtitan.core

import grails.transaction.Transactional

@Transactional
class CarService {

    def secService

    def serviceMethod() {

    }

    def getCurrentCars()
    {
        return Car.findAllByCompany(secService.currentCompany())
    }
}
