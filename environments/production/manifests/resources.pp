# resources.pp 
#
# Add virtual resources and variables here
#
# An example account
#@account::user {
#    "administrator":
#    userid    => "administrator",
#    ensure    => present,
#    password  => '$6$n45GwZNp$1Z.L98g8x.d/GfVXe5XqHVu22eCN0.dRdvZdAqyZPvrAuhX/8j48ypbbs0mAVnnzA4xk0oVe2XTyvIfDonhd21'
#    pubkey    => "123rfr43e",
#    isadmin   => true,
#    allowssh  => true,
#    searchtag => "all",
#}
# Disable root logins on all systems
@account::user {
    "root":
    userid    => "root",
    password  => "*",
    isadmin   => false,
    allowssh  => false,
    searchtag => "all",
}
# Add a sudo rule for wheel
@sudo::rule { wheelall:
        who               => "%wheel",
        as_user           => "ALL",
        password_required => true,
        commands          => ["ALL"],
        searchtag         => "all",
    }


# Always persist firewall rules
exec { 'persist-firewall':
  command     => $operatingsystem ? {
    'ubuntu'          => '/sbin/iptables-save > /etc/iptables/rules.v4',
    /(RedHat|CentOS)/ => '/sbin/iptables-save > /etc/sysconfig/iptables',
  },
  refreshonly => true,
}
Firewall {
  notify  => Exec['persist-firewall'],
  before  => Class['fw::post'],
  require => Class['fw::pre'],
}
Firewallchain {
  notify  => Exec['persist-firewall'],
}
resources { "firewall":
  purge => true
}
@firewall {"0100 allow ssh":
    proto  => "tcp",
    dport  => "22",
    action => "accept"
}

#
# class production
#
#
class production {
    # Puppet
    #$puppetver = $operatingsystem ? {
    #        /(RedHat|Fedora|CentOS)/ => "2.7.12-1.el6",
    #        /(Ubuntu|Debian)/        => "2.7.12-1puppetlabs1",
    #}
    #puppet::client{'puppet client': puppetserver => 'puppet.customer.tld', puppetversion => $puppetver}
    # Accounts
    # Activate all users with search tag all or prod
    Account::User <| searchtag == all |>
    Account::User <| searchtag == prod |>
    # Sudo
    # Activate all sudo rules with search tag all or prod
    Sudo::Rule <| searchtag == all |>
    Sudo::Rule <| searchtag == prod |>
    # SSHD
    # Configure and install sshd
    ssh::config { sshdprod: 
        port       => "22", 
        rootlogin  => false,
        keyonly    => false,
   }
   # run our firewall rules
   include fw::pre
   include fw::post
   Firewall <| |> {notify => Exec["persist-firewall"] }
}     

# Now include "production" in your node def!
#
