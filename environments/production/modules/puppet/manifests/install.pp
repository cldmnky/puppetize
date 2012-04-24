#
#
#
#
class puppet::install {
    package { $puppet::augpkgs:
      ensure  => present,
      require => Class['puppet::repo']
    }
}
