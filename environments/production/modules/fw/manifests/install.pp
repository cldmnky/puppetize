class fw::install {
  case $::operatingsystem {
      ubuntu, debian: {
          package {$fw::packages:
            ensure   => present,
            provider => 'dpkg',
            source   => '/tmp/iptables-persistent_0.5.3ubuntu1_all.deb'
          }
      }
      redhat, centos : {
        package {$fw::packages:
          ensure  => present
        }
      }
      default: {
          fail('Unknown OS')
      }
    }
}
