# Class: nrpe
#
# This module manages nrpe
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class nrpe (
  $nagios_server,
  $packages = $nrpe::params::packages,
  $service = $nrpe::params::service,
  $config_file = $nrpe::params::config_file,
  $config_dir_d = $nrpe::params::config_dir_d,
  $plugin_dir = $nrpe::params::plugin_dir,
) inherits nrpe::params {
  anchor { 'nrpe::start': } ->
  class { 'nrpe::install': } ->
  class { 'nrpe::config': } ->
  class { 'nrpe::service': } ->
  anchor { 'nrpe::end': }
}
