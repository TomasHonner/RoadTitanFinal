package roadtitan.security;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

@groovy.transform.ToString(cache=true, includeNames=true, includePackage=false) public class SecUserSecRole
  extends java.lang.Object  implements
    java.io.Serializable,    groovy.lang.GroovyObject {
;
public SecUserSecRole
(roadtitan.security.SecUser u, roadtitan.security.SecRole r) {
super ();
}
public static  roadtitan.security.SecUserSecRole create(roadtitan.security.SecUser secUser, roadtitan.security.SecRole secRole) { return (roadtitan.security.SecUserSecRole)null;}
public static  boolean remove(roadtitan.security.SecUser u, roadtitan.security.SecRole r) { return false;}
public static  void removeAll(roadtitan.security.SecUser u) { }
public static  void removeAll(roadtitan.security.SecRole r) { }
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public  roadtitan.security.SecUser getSecUser() { return (roadtitan.security.SecUser)null;}
public  void setSecUser(roadtitan.security.SecUser value) { }
public  roadtitan.security.SecRole getSecRole() { return (roadtitan.security.SecRole)null;}
public  void setSecRole(roadtitan.security.SecRole value) { }
public static  java.lang.Object getConstraints() { return null;}
public static  void setConstraints(java.lang.Object value) { }
public static  java.lang.Object getMapping() { return null;}
public static  void setMapping(java.lang.Object value) { }
@java.lang.Override() public  boolean equals(java.lang.Object other) { return false;}
@java.lang.Override() public  int hashCode() { return (int)0;}
public static  roadtitan.security.SecUserSecRole get(long secUserId, long secRoleId) { return (roadtitan.security.SecUserSecRole)null;}
public static  boolean exists(long secUserId, long secRoleId) { return false;}
public static  roadtitan.security.SecUserSecRole create(roadtitan.security.SecUser secUser, roadtitan.security.SecRole secRole, boolean flush) { return (roadtitan.security.SecUserSecRole)null;}
public static  boolean remove(roadtitan.security.SecUser u, roadtitan.security.SecRole r, boolean flush) { return false;}
public static  void removeAll(roadtitan.security.SecUser u, boolean flush) { }
public static  void removeAll(roadtitan.security.SecRole r, boolean flush) { }
}
