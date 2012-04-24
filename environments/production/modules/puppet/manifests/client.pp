#! /usr/bin/env puppet
# Author: Magnus Bengtsson <magnus.bengtsson@redbridge.se>
#
#
#
#
define puppet::client ($puppetserver, $puppetversion){
  include puppet
  class { puppet::install::client: 
    puppetversion => $puppetversion,
  }
  include puppet::client::service
  class { puppet::client::config:
    puppetserver => $puppetserver,
  }
}
