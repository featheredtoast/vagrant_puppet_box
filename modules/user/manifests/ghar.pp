class user::ghar{
    require python
    require git
}

define ghar($user, $repositories) {
    vcsrepo { "/home/${user}/ghar":
		ensure => present,
		provider => git,
		source => "https://github.com/philips/ghar.git",
		owner => "${user}",
		group => "${user}",
	}
	
	ghar-add { $user:
        user => $user,
        repositories => $repositories,
	}
	
	exec { "ghar-install-$user":
		command => "ghar install",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/${user}/ghar/bin/"],
		# user => ${user},
		environment => ["HOME=/home/${user}/"],
		group => "${user}",
		cwd => "/home/${user}/",
		refreshonly => true,
		notify => File["/home/${user}"],
	}
	
	file { "/home/${user}":
		ensure => "directory",
		recurse => true,
		owner  => "${user}",
		group  => "${user}",
	}
}

define ghar-add( $user, $repositories ) {
	exec { "ghar-add-${user}":
		command => "ghar add ${repositories}",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/${user}/ghar/bin/"],
		require => Vcsrepo["/home/${user}/ghar"],
		notify => Exec["ghar-install-${user}"],
	}
	
	
}
