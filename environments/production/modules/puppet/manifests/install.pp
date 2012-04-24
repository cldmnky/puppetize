#
#
#
#
class puppet::install {
  include puppet::repo
  package { $puppet::augpkgs:
    ensure  => present,
    require => Class['puppet::repo']
  }
}
