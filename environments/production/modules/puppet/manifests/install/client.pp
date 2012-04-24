#! /usr/bin/env puppet
# Author: Magnus Bengtsson <magnus.bengtsson@redbridge.se>
# Class: puppet::install::client
#
# 
#
# Parameters:
#
# Actions:
#
#            Requires:
#
# Sample Usage:
class puppet::install::client($puppetversion) inherits puppet::install {
    package { $puppet::puppetpkgs:
      ensure  => $puppetversion,
    }
}
