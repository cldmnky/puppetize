#! /usr/bin/env puppet
# Author: Magnus Bengtsson <magnus.bengtsson@redbridge.se>
# Class: puppet::install::master
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
#
class puppet::install::master($puppetversion) inherits puppet::install {
  package{ $puppet::puppetmasterpkgs:
    ensure  => $puppetversion
  }
}
