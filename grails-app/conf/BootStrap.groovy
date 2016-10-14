import enums.CarType
import enums.GsmMode
import org.joda.time.DateTime
import roadtitan.core.*
import roadtitan.location.*
import roadtitan.security.*

class BootStrap {

    def init = { servletContext ->

        if (!AppUser.count) {
            // Define of Security roles
            def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
            def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
            def supervisorRole = SecRole.findByAuthority('ROLE_SUPERVISOR') ?: new SecRole(authority: 'ROLE_SUPERVISOR').save(failOnError: true)

            // User with admin privileges
            def adminUser = AppUser.findByAppUserName('ADMIN') ?: new AppUser(
                    appUserName: 'ADMIN',
                    appUserEmail: 'admin@admin.com',
                    appUserAddress: 'Silicon Valley',
                    appUserPassword: 'admin',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'admin',
                            password: 'admin',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "ADMIN COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!adminUser.secUser.authorities.contains(adminRole)) {
                SecUserSecRole.create adminUser.secUser, adminRole
            }

            def supervisorUser = AppUser.findByAppUserName('SUPERVISOR') ?: new AppUser(
                    appUserName: 'SUPERVISOR',
                    appUserEmail: 'supervisor@supervisor.com',
                    appUserAddress: 'Olymp',
                    appUserPassword: 'supervisor',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'supervisor',
                            password: 'supervisor',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "SUPERVISOR COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!supervisorUser.secUser.authorities.contains(supervisorRole)) {
                SecUserSecRole.create supervisorUser.secUser, supervisorRole
            }

            def userUser = AppUser.findByAppUserName('USER') ?: new AppUser(
                    appUserName: 'USER',
                    appUserEmail: 'user@user.com',
                    appUserAddress: 'Olymp',
                    appUserPassword: 'user',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'user',
                            password: 'user',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "USER COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!userUser.secUser.authorities.contains(userRole)) {
                SecUserSecRole.create userUser.secUser, userRole
            }

        }

        if (!Car.count)
        {
            Company company1 = new Company(companyName: "Toms Company", companyCode: "123", companyAddress: "Silicon Valley").save(failOnError: true)
            Company company2 = new Company(companyName: "Ondras Company", companyCode: "321", companyAddress: "Silicon Valley").save(failOnError: true)
            Company company3 = new Company(companyName: "Bobs Company", companyCode: "789", companyAddress: "Silicon Valley").save(failOnError: true)

            /*
            Tracker tracker1 = new Tracker(trackerNumber: "1", trackerName: "Tracker 1", trackerGsmMode: GsmMode.MODE_1, trackerImei: "987456321",
            car: new Car(carName: "Škoda Yeti", carRegistrationNumber: "123", carCarType: CarType.PERSONAL, company: company1).save(failOnError: true)
            ).save(failOnError: true)
            Tracker tracker2 = new Tracker(trackerNumber: "2", trackerName: "Tracker 2", trackerGsmMode: GsmMode.MODE_2, trackerImei: "12365477889",
            car: new Car(carName: "VW Transporter", carRegistrationNumber: "456", carCarType: CarType.VAN, company: company1).save(failOnError: true)
            ).save(failOnError: true)
            Tracker tracker3 = new Tracker(trackerNumber: "3", trackerName: "Tracker 3", trackerGsmMode: GsmMode.MODE_3, trackerImei: "963258741",
            car: new Car(carName: "Škoda Superb", carRegistrationNumber: "789", carCarType: CarType.PERSONAL, company: company2).save(failOnError: true)
            ).save(failOnError: true)
            Tracker tracker4 = new Tracker(trackerNumber: "4", trackerName: "Tracker 4", trackerGsmMode: GsmMode.MODE_1, trackerImei: "741258963",
            car: new Car(carName: "Toyota Hillux", carRegistrationNumber: "963", carCarType: CarType.SUV, company: company2).save(failOnError: true)
            ).save(failOnError: true)
            Tracker tracker5 = new Tracker(trackerNumber: "5", trackerName: "Tracker 5", trackerGsmMode: GsmMode.MODE_2, trackerImei: "4569874123",
            car: new Car(carName: "Mercedes Acros", carRegistrationNumber: "147", carCarType: CarType.TIR, company: company3).save(failOnError: true)
            ).save(failOnError: true)
            */

            Car car1 = new Car(carName: "Škoda Yeti", carRegistrationNumber: "123", carCarType: CarType.PERSONAL, company: company1,
                    tracker: new Tracker(trackerNumber: "1", trackerName: "Tracker 1", trackerGsmMode: GsmMode.MODE_1, trackerImei: "123654789",
                            trackerAssigned: true, company: company1, logBook: new LogBook()).save(failOnError: true)
            ).save(failOnError: true)
            Car car2 = new Car(carName: "VW Transporter", carRegistrationNumber: "456", carCarType: CarType.VAN, company: company1,
                    tracker: new Tracker(trackerNumber: "2", trackerName: "Tracker 2", trackerGsmMode: GsmMode.MODE_2, trackerImei: "9874563321",
                            trackerAssigned: true, company: company1, logBook: new LogBook()).save(failOnError: true)
            ).save(failOnError: true)
            Car car3 = new Car(carName: "Škoda Superb", carRegistrationNumber: "789", carCarType: CarType.PERSONAL, company: company2,
                    tracker: new Tracker(trackerNumber: "3", trackerName: "Tracker 3", trackerGsmMode: GsmMode.MODE_3, trackerImei: "147852369",
                            trackerAssigned: true, company: company2, logBook: new LogBook()).save(failOnError: true)
            ).save(failOnError: true)
            Car car4 = new Car(carName: "Toyota Hillux", carRegistrationNumber: "147", carCarType: CarType.SUV, company: company2,
                    tracker: new Tracker(trackerNumber: "4", trackerName: "Tracker 4", trackerGsmMode: GsmMode.MODE_1, trackerImei: "963258741",
                            trackerAssigned: true, company: company2, logBook: new LogBook()).save(failOnError: true)
            ).save(failOnError: true)
            Car car5 = new Car(carName: "Mercedes Acros", carRegistrationNumber: "369", carCarType: CarType.TIR, company: company3,
                    tracker: new Tracker(trackerNumber: "5", trackerName: "Tracker 5", trackerGsmMode: GsmMode.MODE_2, trackerImei: "15963214789",
                            trackerAssigned: true, company: company3, logBook: new LogBook()).save(failOnError: true)
            ).save(failOnError: true)


            Location startL = new Location(latitude: 48.929860, longitude: 14.363940, timestamp: new DateTime(2016,10,12,10,0,0)).save(failOnError: true) //48.929860,
            Location location1 = new Location(latitude: 48.949730, longitude: 14.351807, timestamp: new DateTime(2016,10,12,11,0,0)).save(failOnError: true) //48.949730, 14.351807
            Location location2 = new Location(latitude: 48.955991, longitude: 14.380040, timestamp: new DateTime(2016,10,12,12,0,0)).save(failOnError: true) //48.955991, 14.380040
            Location location3 = new Location(latitude: 48.966575, longitude: 14.390053, timestamp: new DateTime(2016,10,12,13,0,0)).save(failOnError: true) //48.966575, 14.390053
            Location location4 = new Location(latitude: 48.978523, longitude: 14.432656, timestamp: new DateTime(2016,10,12,14,0,0)).save(failOnError: true) // 48.978523, 14.432656
            Location endL = new Location(latitude: 48.977516, longitude: 14.445038, timestamp: new DateTime(2016,10,12,15,0,0)).save(failOnError: true)  // 48.977516, 14.445038

            Trip trip = new Trip()
            trip.addToLocations(startL)
            trip.addToLocations(endL)
            trip.addToLocations(location1)
            trip.addToLocations(location2)
            trip.addToLocations(location3)
            trip.addToLocations(location4)
            trip.setTripStartDateTime(new DateTime())
            trip.setTripEndDateTime(new DateTime())

            trip.save(failOnError: true)
            System.out.print(trip.toString())
            car1.tracker.logBook.addToTrips(trip).save(failOnError: true)

        }

        // Normal users
        if (!AppUser.findByAppUserName('tom'))
        {
            def tomUser = AppUser.findByAppUserName('tom') ?: new AppUser(
                    appUserName: 'tom',
                    appUserEmail: 'tom@tom.com',
                    appUserAddress: 'Olymp',
                    appUserPassword: 'tom',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'tom',
                            password: 'tom',
                            enabled: true).save(failOnError: true),
                    company: Company.findAllByCompanyName("Toms Company")
            ).save(failOnError: true)

            def supervisorRole = SecRole.findByAuthority("ROLE_SUPERVISOR")

            if (!tomUser.secUser.authorities.contains(supervisorRole)) {
                SecUserSecRole.create tomUser.secUser, supervisorRole
            }
        }

        if (!AppUser.findByAppUserName('ondra'))
        {
            def ondraUser = AppUser.findByAppUserName('ondra') ?: new AppUser(
                    appUserName: 'ondra',
                    appUserEmail: 'ondra@ondra.com',
                    appUserAddress: 'Olymp',
                    appUserPassword: 'ondra',
                    secUser: new SecUser(
                            realName: 'Ondra',
                            username: 'ondra',
                            password: 'ondra',
                            enabled: true).save(failOnError: true),
                    company: Company.findAllByCompanyName("Ondras Company")
            ).save(failOnError: true)

            def userRole = SecRole.findByAuthority("ROLE_USER")

            if (!ondraUser.secUser.authorities.contains(userRole)) {
                SecUserSecRole.create ondraUser.secUser, userRole
            }
        }


    }
    def destroy = {
    }
}
