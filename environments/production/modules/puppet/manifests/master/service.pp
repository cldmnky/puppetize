#
#
#
class puppet::master::service {
    service { "puppetmaster":
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        require    => Class["puppet::install::master"]
    }
}
