# Class: puppet::params
#
#  Sets params used in the puppet module 
#
# Parameters:
#
# Actions:
#
#            Requires:
#
# Sample Usage:
#
class puppet::params {
  $module  = "puppet"
  case $::operatingsystem {
    centos, redhat: {
      $augpkgs = ['augeas', 'ruby-augeas']
      $puppetpkgs = ['puppet']
      $puppetmasterpkgs = ['puppet-server']
    }
    ubuntu, debian: {
      $augpkgs = ["augeas-tools", "libaugeas-ruby", "libaugeas0"]
      $puppetpkgs = ['puppet-common', 'puppet']
      $puppetmasterpkgss = ['puppetmaster']
    }
    default: {
      fail('Unknown OS')
    }
  }
}
