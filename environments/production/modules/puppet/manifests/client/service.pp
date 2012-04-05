#
#
#
class puppet::client::service {
    service { "puppet":
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        require    => Class["puppet::install::client"],
    }
}
