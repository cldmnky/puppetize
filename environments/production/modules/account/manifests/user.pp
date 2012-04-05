#
# user.pp
#
#
define account::user ($userid, $password, $pubkey = "", $ensure = 'present', $isadmin = false, $searchtag='', $allowssh = true){
    if ( $isadmin == true ) { 
        group {wheel: ensure =>  present}
    }
    if ( $allowssh == true ){
        group { sshusers: ensure =>  present}
    } 
    if ($allowssh == true) {
        if ($isadmin == true) {
            debug("allow ssh and sudo")
            $supplgr = ["wheel", "sshusers"]
        } else {
            debug("allow ssh only")
            $supplgr = "sshusers"
        }
    } else {
        if ($isadmin == true){
            debug("isadmin only")
            $supplgr = "wheel"
        }
    }
    user {
        $title:
        ensure     => $ensure,
        password   => $password,
        managehome => true,
        groups     => $supplgr,
    }
    if ( $pubkey != "" ) {
        ssh_authorized_key {
            $title:
            ensure  => 'present',
            type    => 'ssh-rsa',
            key     => $pubkey,
            user    => $userid,
            require => User[$userid],
            name    => $userid,
        }
    }
}
