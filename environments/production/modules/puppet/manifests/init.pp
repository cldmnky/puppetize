# Class: puppet
#
# This module manages puppet
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class puppet (
  $augpkgs = $puppet::params::augpkgs,
  $puppetpkgs = $puppet::params::puppetpkgs,
  $puppetmasterpkgs = $puppet::params::puppetmasterpkgs
) inherits puppet::params {
  info("Running puppet module packages: $augpkgs $puppetpkgs $puppetmasterpkgs")
}
