# Puts an iptables-persistent package on systems
class fw::file {
  if $lsbdistcodename == 'precise' {
    file{'/tmp/iptables-persistent_0.5.3ubuntu1_all.deb':
      ensure => present,
      source => 'puppet:///modules/fw/iptables-persistent_0.5.3ubuntu1_all.deb',
    }
  }
}
