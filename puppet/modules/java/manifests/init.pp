# == Class: java
#
# Full description of class java here.
#
class java {
  package { "openjdk-7-jre-headless" :
    ensure => 'present',
  }

}
include java
