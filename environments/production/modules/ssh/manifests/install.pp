#
#
#
class ssh::install {
    package { $ssh::packages:
        ensure  => installed,
    }
}


