class omrsdb {  
  class { 'mysql::client':}
  class { '::mysql::server':
      root_password                => "${dbrootpwd}",
      override_options             => {
        'mysqld'                   => {
          'bind-address'           => '0.0.0.0',
          'default-storage-engine' => 'innodb',
          'character-set-server'   => 'utf8',
          'collation-server'       => 'utf8_general_ci',
        }
      }
  }

    file { '/tmp/demo-1.9.0.tar.gz' :
      ensure => file,
      source => 'puppet:///modules/openmrs/demo-1.9.0.tar.gz',
      before => Exec['extract SQL'],
    }

    exec { 'extract SQL' :
      command => '/bin/tar zxf /tmp/demo-1.9.0.tar.gz',
      creates => '/tmp/demo-1.9.0.sql',
      cwd     => '/tmp',
      before  => Mysql::Db["${dbname}"],
    }

    mysql::db { "${dbname}" :
      user     => "${dbuser}",
      password => "${dbpwd}",
      host     => '%',
      grant    => 'ALL',
      sql      => '/tmp/demo-1.9.0.sql',
      require  => Class['::mysql::server'], 
    }
    
}
