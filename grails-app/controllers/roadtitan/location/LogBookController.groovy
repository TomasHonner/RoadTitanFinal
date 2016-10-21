package roadtitan.location

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import roadtitan.core.Tracker
import roadtitan.security.AppUser

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LogBookController {

    def carService
    def secService

    static allowedMethods = [index: 'GET']

    def index() {
        def cars = carService.getCurrentCars()
        return [cars: cars]
    }

    def show()
    {

        def users = secService.allCurrentCompanyUsers()
        def trips
        Long carId, trackerId
        if (!params.car)
        {
            carId = session["carId"]
            trackerId = session["trackerId"]
        }
        else
        {
            session["trackerId"] = carService.getCar(Long.valueOf(params.car)).getTracker().getId()
            session["carId"] = carService.getCar(Long.valueOf(params.car)).getId()
            carId = session["carId"]
        }

        def tracker = carService.getCar(Long.valueOf(carId)).getTracker()
        if(SpringSecurityUtils.ifAllGranted("ROLE_SUPERVISOR"))
        {
            trips = tracker.logBook.trips
        }
        else
        {
            trips = Trip.findAllByAppUserAndTracker(secService.currentAppUser(), tracker)
        }

        return [trips: trips, users: users]
    }

    def filteredListUserDate()
    {
        def users = secService.allCurrentCompanyUsers()
        def tracker = Tracker.findById(session["trackerId"])
        Long userId
        if (!params.user)
        {
            if (!session["userId"])
            {
                userId = null
            }
            else
            {
                userId = Long.valueOf(session["userId"])
            }
        }
        else
        {
            session["userId"] = params.user
            userId = Long.valueOf(session["userId"])
        }
        DateTime dateFrom = DateTimeFormat.forPattern("yyyy-MM-dd").parseDateTime(params.dateFrom)
        DateTime dateTo = DateTimeFormat.forPattern("yyyy-MM-dd").parseDateTime(params.dateTo)
        def trips
        if(SpringSecurityUtils.ifAllGranted("ROLE_SUPERVISOR"))
        {
            AppUser user = secService.getAppUser(userId)
            trips =  Trip.findByAppUserAndTrackerAndTripStartDateTimeGreaterThanEqualsAndTripEndDateTimeLessThanEquals(user, tracker, dateFrom, dateTo)
        }
        else
        {
            trips = Trip.findByAppUserAndTrackerAndTripStartDateTimeGreaterThanEqualsAndTripEndDateTimeLessThanEquals(secService.currentAppUser(), tracker, dateFrom, dateTo)
        }

        render view: "show", model: [trips: trips, users: users]
    }
}
