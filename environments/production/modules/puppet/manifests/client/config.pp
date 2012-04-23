#
#
#
#
class puppet::client::config($puppetserver){
    file { "/etc/puppet/puppet.conf":
        ensure  => present,
        content => template("puppet/puppet.conf.erb"),
        owner   => "puppet",
        group   => "puppet",
        require => Class["puppet::install::client"],
        notify  => Class["puppet::client::service"],
    }
}
