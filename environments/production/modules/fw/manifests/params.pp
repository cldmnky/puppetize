#
#
#
#
class fw::params {
    case $::operatingsystem {
        ubuntu, debian: {
            $packages = ['iptables-persistent']
        }
        redhat, centos: {
            $packages = ['iptables']
        }
        default: {
            fail("Unkown OS: $::operatingsystem")
        }
    }
}
