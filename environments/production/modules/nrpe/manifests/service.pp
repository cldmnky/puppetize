class nrpe::service {
  service{"$nrpe::service":
    enable    => true,
    ensure    => running,
    hasstatus  => true,
  }
}
