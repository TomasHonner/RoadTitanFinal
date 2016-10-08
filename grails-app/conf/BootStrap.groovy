import roadtitan.core.Company
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




    }
    def destroy = {
    }
}
