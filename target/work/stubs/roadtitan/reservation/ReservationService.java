package roadtitan.reservation;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"}) @grails.transaction.Transactional() public class ReservationService
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
public  java.lang.Object serviceMethod() { return null;}
public  java.lang.Object checkReservation(roadtitan.reservation.Reservation reservation) { return null;}
public  java.lang.Object checkReservationObject(roadtitan.reservation.Reservation reservation) { return null;}
public  java.lang.Object checkReservationDate(org.joda.time.DateTime from, org.joda.time.DateTime to) { return null;}
public  java.lang.Object checkReservationTimeLine(org.joda.time.DateTime from, org.joda.time.DateTime to) { return null;}
}
