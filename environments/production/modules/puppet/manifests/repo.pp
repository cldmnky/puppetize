#
#
#
#
class puppet::repo {
    include "puppet::repo::$operatingsystem"
}

class puppet::repo::redhat {
    yumrepo { "puppetlabs":
        baseurl  => "http://yum.puppetlabs.com/el/6/products/",
        descr    => "Puppet Labs Packages",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
    }
}

class puppet::repo::centos inherits puppet::repo::redhat {
}

class puppet::repo::ubuntu {
    apt::source { 'puppetlabs':
        location   => 'http://apt.puppetlabs.com',
        repos      => 'main',
        key        => '4BD6EC30',
        key_server => 'pgp.mit.edu',
    }
}
