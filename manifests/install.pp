class oracle_dev::install inherits oracle_dev {
  yumrepo { 'oracle_dev':
    baseurl => "http://uds-puppet.moscow.eurochem.ru/oracle-contrib/${operatingsystem}/${operatingsystemmajrelease}/${architecture}",
    descr => 'Eurochem Oracle Dev Repository',
    enabled => 1,
    gpgcheck => 0,
  }
  
  package { 'oracle-instantclient12.1-basic':
    ensure => $package_ensure,
    require => Yumrepo['oracle_dev'],
  }
  
  package { 'oracle-instantclient12.1-devel':
    ensure => $package_ensure,
    require => Yumrepo['oracle_dev'],
  }

  package { 'oracle-instantclient12.1-sqlplus':
    ensure => $package_ensure,
    require => Yumrepo['oracle_dev'],
  }

  file { "/etc/profile.d/oracle.sh":
    ensure => file,
    owner => 0,
    mode => '0644',
    source => "puppet:///modules/${module_name}/oracle.sh",
    replace => 'no',
    require => Yumrepo['oracle_dev'],
  }
}
