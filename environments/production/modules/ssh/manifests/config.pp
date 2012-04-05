#
#
#
#
define ssh::config($port = "22", $keyonly = false, $allowgroup = "sshusers" , $rootlogin = false) {
    include ssh
    if ($keyonly == true ){
        $passwordauthentication = "no"
    }
    if ($rootlogin == false){
        $permitrootlogin = "no"
    }
    if ($allowgroup != ""){
        $allowgroups = $allowgroup
    }
    augeas { "sshdconfig":
            context => "/files/etc/ssh/sshd_config",
            changes =>  template("ssh/sshd_config.erb"),
            require => Class["ssh::install"],
            notify => Class["ssh::service"],
    }
}
