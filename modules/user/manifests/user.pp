class user::user {
	add_user { jwong:
			email    => "awole20@gmail.com",
			uid      => 5001
	}
	
	add_ssh_key { jwong:
			key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+iRTDrQ6wcARIIkK/TMU+b9DgrBv5RJ/GX4k4U+hUGxqNXQFFOhJDhZCD6bTydGLqMoZ4zbrtXURDkBLHz3SYgETVb+DUJu8z1IEYCsIvvYSMLkbvQhm8HGxJEF3qPnmmhwPvcORIXbtg7yr0yDUAlVYq3RaL5MTOfo+bQ97vbynnnoLS9EVQpNWj6zYXa44I1xAG4bPmzr2//LWOa+2v3Is0HB7IRpY4aHXVRhZZ/iT4AR+goCIE1JfX/uxxVTJicmKgAxtNbK9kaqNy+hmZ2uEO8LKpBJtAGZ6im7YbIf3FtcoXy5M3mrjs9J2AsJWFvHw3SjbblsUO7RdwhqvJ awole20@gmail.com",
			type    => "ssh-rsa"

	}
}

define add_user ( $email, $uid ) {

		$username = $title

		user { $username:
				comment => "$email",
				home    => "/home/$username",
				shell   => "/bin/zsh",
				uid     => $uid
		}

		group { $username:
				gid     => $uid,
				require => User[$username]
		}

		file { "/home/$username/":
				ensure  => directory,
				owner   => $username,
				group   => $username,
				mode    => 750,
				require => [ User[$username], Group[$username] ]
		}

		file { "/home/$username/.ssh":
				ensure  => directory,
				owner   => $username,
				group   => $username,
				mode    => 700,
				require => File["/home/$username/"]
		}

		# now make sure that the ssh key authorized files is around
		file { "/home/$username/.ssh/authorized_keys":
				ensure  => present,
				owner   => $username,
				group   => $username,
				mode    => 600,
				require => File["/home/$username/"]
		}
}
	
define add_ssh_key( $key, $type ) {

		$username       = $title

		ssh_authorized_key{ "${username}_${key}":
				ensure  => present,
				key     => $key,
				type    => $type,
				user    => $username,
				require => File["/home/$username/.ssh/authorized_keys"]

		}

}