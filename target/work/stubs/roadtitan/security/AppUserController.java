package roadtitan.security;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;
import static org.springframework.http.HttpStatus.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR"}) @grails.transaction.Transactional(readOnly=true) public class AppUserController
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
public static  java.lang.Object getAllowedMethods() { return null;}
public static  void setAllowedMethods(java.lang.Object value) { }
public  java.lang.Object index(java.lang.Integer max) { return null;}
public  java.lang.Object show(roadtitan.security.AppUser appUserInstance) { return null;}
public  java.lang.Object create() { return null;}
@grails.transaction.Transactional() public  java.lang.Object preSave(roadtitan.security.AppUser appUserInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object save(roadtitan.security.AppUser appUserInstance) { return null;}
public  java.lang.Object edit(roadtitan.security.AppUser appUserInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object update(roadtitan.security.AppUser appUserInstance) { return null;}
@grails.transaction.Transactional() public  java.lang.Object delete(roadtitan.security.AppUser appUserInstance) { return null;}
protected  void notFound() { }
@grails.transaction.Transactional() public  java.lang.Object enableAccount(roadtitan.security.AppUser appUserInstance) { return null;}
}
