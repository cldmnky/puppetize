## Define: nrpe::check
#
# Adds services to be checked in nrpe
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#    nrpe::check { 'proc_syslog': check_name => 'proc_syslog', check_binary => 'check_procs', check_args => '-w 1: -c 1:2 -C rsyslogd'}
#    nrpe::check { 'home_disk': check_name => 'home_disk', check_binary => 'check_disk', check_args => '-w 20% -c 10% -p /home -m'}
#
define nrpe::check ($check_name, $check_binary, $check_args) {
  $plugin_dir = $nrpe::params::plugin_dir
  $config_dir_d = $nrpe::params::config_dir_d
  file{"$nrpe::config_dir_d/$check_name.cfg":
      content => template('nrpe/service_template.cfg.erb'),
      notify  => Class['nrpe::service']
  }  
}
