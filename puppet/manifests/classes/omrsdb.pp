class omrsdb {  
  class { 'mysql::client':}
  class { '::mysql::server':
      root_password                => "${$dbrootpwd}",
      override_options             => {
        'mysqld'                   => {
          'bind-address'           => '0.0.0.0',
           'default-storage-engine' => 'innodb',
           'character-set-server'   => 'utf8',
          'collation-server'       => 'utf8_general_ci',
          }
                                  }
  }
    mysql::db { "${dbname}" :
      user     => "${dbuser}",
      password => "${dbpwd}",
      host     => '%',
      grant   => 'ALL'
    }
}
