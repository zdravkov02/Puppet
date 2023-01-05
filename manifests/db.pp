class { '::mysql::server':
  root_password           => 'Password1',
  remove_default_accounts => true,
  restart                 => true,
  override_options => {
    mysqld => { bind-address => '0.0.0.0'}
  },
}

file { '/tmp/db_setup.sql':
ensure => present,
source => "/vagrant/shared/db/db_setup.sql",

}

mysql::db { 'cities':
  user        => 'web_user',
  password    => 'Password1',
  dbname      => 'cities',
  host        => '%',
  sql         => ['/tmp/db_setup.sql'],
  enforce_sql => true,
}

class { 'firewall': }

firewall { '000 accept 3306/tcp':
  action   => 'accept',
  dport    => 3306,
  proto    => 'tcp',
}