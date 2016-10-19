package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
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
