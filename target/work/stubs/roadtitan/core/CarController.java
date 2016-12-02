package roadtitan.core;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;
import static org.springframework.http.HttpStatus.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR"}) @grails.transaction.Transactional(readOnly=true) public class CarController
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
public static  java.lang.Object getAllowedMethods() { return null;}
public static  void setAllowedMethods(java.lang.Object value) { }
public  java.lang.Object index(java.lang.Integer max) { return null;}
public  java.lang.Object show(roadtitan.core.Car carInstance) { return null;}
public  java.lang.Object create() { return null;}
@grails.transaction.Transactional() public  java.lang.Object save(roadtitan.core.Car carInstance) { return null;}
public  java.lang.Object edit(roadtitan.core.Car carInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object update(roadtitan.core.Car carInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object delete(roadtitan.core.Car carInstance) { return null;}
protected  void notFound() { }
}
