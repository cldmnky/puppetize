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
  case $::operatingsystem {
      ubuntu, debian: {
        package{ 'puppetmaster':
          ensure  => $puppetversion
        }
      }
      redhat, centos: {
          package { "puppet-server":
              ensure => $puppetversion,
          }
      }
      default: {  }
    }
}

class puppet::install::client($puppetversion) inherits puppet::install {
    package { "puppet-common":
        ensure  => $puppetversion,
        require => Class["puppet::repo"] 
    }
    package { "puppet":
        ensure  => $puppetversion,
        require => Package["puppet-common"] 
    }
}
