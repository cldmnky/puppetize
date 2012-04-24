#
#
#
#
define puppet::master($puppetversion){
  include puppet
  class { puppet::install::master:
    puppetversion => $puppetversion,
  }
  include puppet::master::service
}
