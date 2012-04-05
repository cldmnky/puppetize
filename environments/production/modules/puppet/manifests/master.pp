#
#
#
#
define puppet::master($puppetversion){
    class { puppet::install::master:
            puppetversion => $puppetversion,
    }
    include puppet::master::service
}
