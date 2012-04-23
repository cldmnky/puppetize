define nrpe::check ($service_check) {
  file{"$nrpe::config_dir_d/$service_check":
      content => template('nrpe/service_template.cfg.erb') 
  }  
}
