class nrpe::config {
  $nagios_server = $nrpe::nagios_server
  $plugin_dir = $nrpe::plugin_dir
  file {"$nrpe::config_file":
    ensure  => present,
    content => template('nrpe/nrpe.cfg.erb'),
    require => Class['nrpe::install'],
    notify  => Class['nrpe::service']
  }
  file {"$nrpe::config_dir_d/varmdo.cfg":
    ensure  => present,
    content => template('nrpe/default.cfg.erb'),
    require => Class['nrpe::install'],
    notify  => Class['nrpe::service']
  }
}
