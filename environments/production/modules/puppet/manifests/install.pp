#
#
#
#
class puppet::install {
    include puppet::repo
    $augpkgs = $operatingsystem ? {
        /(RedHat|Fedora|CentOS)/ => ["augeas", "ruby-augeas"],
        /(Ubuntu|Debian)/ => ["augeas-tools", "libaugeas-ruby", "libaugeas0"],
    }
    package { $augpkgs:
        ensure  => present,
    }
}

class puppet::install::master($puppetversion) inherits puppet::install {
    package { "puppet-server":
        ensure => $puppetversion,
    }
}

class puppet::install::client($puppetversion) inherits puppet::install {
    package { "puppet":
        ensure  => $puppetversion,
        require => Class["puppet::repo"] 
    }
}
