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

    def getCar(Long id)
    {
        return Car.findById(id)
    }
}
