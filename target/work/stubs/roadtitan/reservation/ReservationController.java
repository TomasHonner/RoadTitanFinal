package roadtitan.reservation;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;
import static org.springframework.http.HttpStatus.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"}) @grails.transaction.Transactional(readOnly=true) public class ReservationController
  extends java.lang.Object  implements
    groovy.lang.GroovyObject {
;
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public  java.lang.Object getSecService() { return null;}
public  void setSecService(java.lang.Object value) { }
public  java.lang.Object getCarService() { return null;}
public  void setCarService(java.lang.Object value) { }
public  java.lang.Object getReservationService() { return null;}
public  void setReservationService(java.lang.Object value) { }
public static  java.lang.Object getAllowedMethods() { return null;}
public static  void setAllowedMethods(java.lang.Object value) { }
public  java.lang.Object index(java.lang.Integer max) { return null;}
@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_SUPERVISOR","ROLE_ADMIN"}) public  java.lang.Object forApproval(java.lang.Integer max) { return null;}
@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_SUPERVISOR","ROLE_ADMIN"}) @grails.transaction.Transactional() public  java.lang.Object approve() { return null;}
@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_SUPERVISOR","ROLE_ADMIN"}) @grails.transaction.Transactional() public  java.lang.Object reject() { return null;}
public  java.lang.Object show(roadtitan.reservation.Reservation reservationInstance) { return null;}
public  java.lang.Object create() { return null;}
@grails.transaction.Transactional() public  java.lang.Object preSave(roadtitan.reservation.Reservation reservationInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object save(roadtitan.reservation.Reservation reservationInstance) { return null;}
public  java.lang.Object edit(roadtitan.reservation.Reservation reservationInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object update(roadtitan.reservation.Reservation reservationInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object delete(roadtitan.reservation.Reservation reservationInstance) { return null;}
protected  void notFound() { }
}
