package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR"])
@Transactional
class LogBookService {

    def serviceMethod() {

    }
}
