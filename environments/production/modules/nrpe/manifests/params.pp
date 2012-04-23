class nrpe::params {
  file{"/etc/nagios":
    ensure => directory
  }
  file{"/etc/nagios/nrpe.d":
    ensure => directory
  }
  case $::operatingsystem {
    ubuntu, debian: {
      $packages = 'nagios-nrpe-server'
      $service = 'nagios-nrpe-server'
      $config_file = '/etc/nagios/nrpe.cfg'
      $config_dir_d = '/etc/nagios/nrpe.d'
      $plugin_dir = '/usr/lib/nagios/plugins'
    }
    redhat, centos: {
      $packages = 'nagios-nrpe'
    }
    default: { fail('Unkown OS')  }
  }
}
