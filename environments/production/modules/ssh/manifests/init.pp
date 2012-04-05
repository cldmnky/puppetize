# Class: ssh
#
# This module manages ssh
#
# Parameters:
#
# Actions:
#
# Requires: stdlib
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class ssh (
    $packages = $ssh::params::packages,
    $service = $ssh::params::service
) inherits ssh::params {
    anchor { 'ssh::start': } ->
    class { 'ssh::install': } ~>
    class { 'ssh::service': } ~>
    anchor { 'ssh::end': }
}
