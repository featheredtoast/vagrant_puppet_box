class ghar::ghar($user, $repositories) {
	
	vcsrepo { "/home/${user}/ghar":
		require => Class["git", "python"],
		ensure => present,
		provider => git,
		source => "https://github.com/philips/ghar.git",
		owner => "${user}",
		group => "${user}",
	}
	
	ghar-add { $repositories:
	}
	
	exec { "ghar-install":
		command => "ghar install",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/${user}/ghar/bin/"],
		# user => ${user},
		environment => ["HOME=/home/${user}/"],
		group => "${user}",
		cwd => "/home/${user}/",
		refreshonly => true,
	}
	
}

define ghar-add( ) {
	exec { "ghar-add-${name}":
		command => "ghar add ${name}",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/${ghar::ghar::user}/ghar/bin/"],
		require => Vcsrepo["/home/${ghar::ghar::user}/ghar"],
		notify => Exec["ghar-install"],
	}
}