package roadtitan.security;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

@grails.plugin.springsecurity.annotation.Secured(value={"ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"}) @grails.transaction.Transactional() public class SecService
  extends java.lang.Object  implements
    groovy.lang.GroovyObject {
;
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public  java.lang.Object getSpringSecurityService() { return null;}
public  void setSpringSecurityService(java.lang.Object value) { }
public  java.lang.Object serviceMethod() { return null;}
public  java.lang.Object currentCompany() { return null;}
public  java.lang.Object currentAppUser() { return null;}
public  java.lang.Object allCurrentCompanyUsers() { return null;}
public  java.lang.Object currentSecUser() { return null;}
public  java.lang.Object currentUserRole() { return null;}
public  java.lang.Object getAppUser(java.lang.Long id) { return null;}
}
