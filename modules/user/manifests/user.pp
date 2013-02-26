class user::user{
}

define createUser($user, $groups, $sshkey, $sshkeytype, $sshkeycomment, $passwordhash, $shell) {
	
    user { "$user":
      ensure     => "present",
      groups => $groups,
      shell => "$shell",
      managehome => true,
      password => '$passwordhash'
    }

    file { "/home/$user/.ssh":
        mode    => 700,
        owner   => "$user",
        group   => "$user",
        ensure => "directory",
        require => User["$user"],
    }

    ssh_authorized_key{ "$user" :
        require => File["/home/$user/.ssh"],
        ensure => "present",
        key => "$sshkey",
        user => "$user",
        type => "$sshkeytype",
        name => "$sshkeycomment",
    }

}


