#
#
#
#
class ssh::params {
    case $::operatingsystem {
        ubuntu, debian: {
            $packages = ['openssh-server', 'openssh-client']
        }
        redhat, centos: {
            $packages = ['openssh', 'openssh-server', 'openssh-clients']
        }
        default: {
            fail("Unkown OS: $::operatingsystem")
        }
    }
    case $::operatingsystem {
        ubuntu, debian: {
            $service = 'ssh'
        }
        redhat, centos: {
            $service = 'sshd'
        }
        default: {
            fail("Unkown OS: $::operatingsystem")
        }
    }
}
