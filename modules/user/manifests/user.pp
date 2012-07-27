class user::user {
	add_user { jwong:
			uid      => 5001,
			password => "123",
			shell => "/bin/zsh",
			groups	=> ['admin'],
			sshkeytype => "ssh-rsa",
			sshkey     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+iRTDrQ6wcARIIkK/TMU+b9DgrBv5RJ/GX4k4U+hUGxqNXQFFOhJDhZCD6bTydGLqMoZ4zbrtXURDkBLHz3SYgETVb+DUJu8z1IEYCsIvvYSMLkbvQhm8HGxJEF3qPnmmhwPvcORIXbtg7yr0yDUAlVYq3RaL5MTOfo+bQ97vbynnnoLS9EVQpNWj6zYXa44I1xAG4bPmzr2//LWOa+2v3Is0HB7IRpY4aHXVRhZZ/iT4AR+goCIE1JfX/uxxVTJicmKgAxtNbK9kaqNy+hmZ2uEO8LKpBJtAGZ6im7YbIf3FtcoXy5M3mrjs9J2AsJWFvHw3SjbblsUO7RdwhqvJ awole20@gmail.com",
	}
}

define add_user ( $uid, $password, $shell, $groups, $sshkeytype, $sshkey) {

 $homedir = $kernel ? {
  'SunOS' => '/export/home',
  default   => '/home'
 }
 
 $username = $title
 user { $username:
  comment => "$name",
  home    => "$homedir/$username",
  shell   => "$shell",
  uid     => $uid,
  gid => $uid,
  managehome => 'true',
  password  => "$password",
  groups => $groups
 }

 group { $username:
  gid => "$uid"
 }

 ssh_authorized_key{ $username: 
  user => "$username",
  ensure => present, 
  type => "$sshkeytype", 
  key => "$sshkey", 
  name => "$username" 
 } 
}