#
#
#
class ssh::install {
    package { $ssh::packages:
        ensure  => installed,
    }
}

class install {
  package{"test":
    ensure => present
    do     => "eee"
  }
}

