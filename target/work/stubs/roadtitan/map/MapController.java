package roadtitan.map;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"}) @grails.transaction.Transactional() public class MapController
  extends java.lang.Object  implements
    groovy.lang.GroovyObject {
;
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public static  java.lang.Object getAllowedMethods() { return null;}
public static  void setAllowedMethods(java.lang.Object value) { }
public  java.lang.Object getTripService() { return null;}
public  void setTripService(java.lang.Object value) { }
public  java.lang.Object index() { return null;}
public  java.lang.Object tripMap() { return null;}
public  java.lang.Object carMap() { return null;}
public  java.lang.Object getTripLocations() { return null;}
public  java.lang.Object getCarLocation() { return null;}
}
