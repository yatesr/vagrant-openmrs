# == Class: openmrs
# Depends on: tomcat module
# Full description of class openmrs here.
#

class openmrs {
  # get war
  exec { 'download openmrs' :
    command => "/usr/bin/wget -O openmrs.war http://mavenrepo.openmrs.org/nexus/service/local/repositories/releases/content/org/openmrs/web/openmrs-webapp/${openmrsVersion}/openmrs-webapp-${openmrsVersion}.war",
    cwd     => '/var/lib/tomcat7/webapps',
    creates => "/var/lib/tomcat7/webapps/openmrs.war",
    notify  => Service['tomcat7'],
    require => [Package['tomcat7'],File['/usr/share/tomcat7/.OpenMRS/openmrs-runtime.properties']],
  }

  # create .OpenMRS directory 
  file { '/usr/share/tomcat7/.OpenMRS' :
    ensure  => directory,
    mode    => 644,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    notify  => Service['tomcat7'],
    require => Package['tomcat7'],
    before  => File['/usr/share/tomcat7/.OpenMRS/openmrs-runtime.properties'],
  }

  # Insert openmrs-runtime properties
  file { '/usr/share/tomcat7/.OpenMRS/openmrs-runtime.properties' :
    ensure  => file,
    mode    => 644,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    content => template('openmrs/openmrs-runtime.properties.erb'),
    notify  => Service['tomcat7'],
    require => Package['tomcat7'],
  }
  
}
