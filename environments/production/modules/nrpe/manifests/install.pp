class nrpe::install {
  package { "$nrpe::packages":
    ensure  => present
  }
}
