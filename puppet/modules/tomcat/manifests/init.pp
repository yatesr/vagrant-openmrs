# == Class: tomcat
#
# Full description of class tomcat here.
#
#
class tomcat {
  package { 'tomcat7' :
    ensure => present,
    before => File['/etc/default/tomcat7'],
  }

  file { '/etc/default/tomcat7' :
    ensure  => present,
    mode    => 644,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/tomcat/tomcat7',
  }

  service { 'tomcat7' :
    ensure  => running,
    enable  => true,
    subscribe => File['/etc/default/tomcat7'],
  }

}
