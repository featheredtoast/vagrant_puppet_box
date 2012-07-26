class ghar::ghar {
	
	vcsrepo { "/home/jwong/ghar":
		require => Class["git", "python"],
		ensure => present,
		provider => git,
		source => "https://github.com/philips/ghar.git",
		owner => "jwong",
		group => "jwong",
	}
	
	ghar-add { "zshrc":
		location => "https://github.com/awole20/zshrc.git",
		notify => Exec["ghar-install"],
	}
	ghar-add { "vimrc":
		location => "https://github.com/awole20/vimrc.git",
		notify => Exec["ghar-install"],
	}
	ghar-add { "gitconfig":
		location => "https://github.com/awole20/gitconfig.git",
		notify => Exec["ghar-install"],
	}
	
	exec { "ghar-install":
		command => "ghar install",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/jwong/ghar/bin/"],
		require => Ghar-add["zshrc", "vimrc", "gitconfig"],
		user => jwong,
	}
	
}

define ghar-add( $location ) {
	exec { "ghar-add-${location}":
		command => "ghar add ${location}",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/jwong/ghar/bin/"],
		require => Vcsrepo["/home/jwong/ghar"],
		user => jwong,
	}
}