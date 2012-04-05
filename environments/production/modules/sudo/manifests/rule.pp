#
#
#
define sudo::rule($who, $as_user, $password_required, $commands, $searchtag){
    # Build the command list
    if ($password_required == true){
        $pass = "PASSWD"
    } else {
        $pass = "NOPASSWD"
    }
    augeas { $title:
        context => "/files/etc/sudoers",
        changes => template("sudo/sudoers.erb"),
    }
}
