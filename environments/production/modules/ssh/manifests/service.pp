#
#
#
class ssh::service {
    service { $ssh::service:
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
    }
}
