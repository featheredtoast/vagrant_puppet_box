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
	}
	ghar-add { "vimrc":
		location => "https://github.com/awole20/vimrc.git",
	}
	ghar-add { "gitconfig":
		location => "https://github.com/awole20/gitconfig.git",
	}
	
	exec { "ghar-install":
		command => "ghar install",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/jwong/ghar/bin/"],
		require => Ghar-add["zshrc", "vimrc", "gitconfig"],
		# user => jwong,
		environment => ["HOME=/home/jwong/"],
		group => "jwong",
		cwd => "/home/jwong/"
	}
	
	file { "/home/jwong/":
		ensure => "directory",
		recurse => true, 
		owner  => "jwong",
		group  => "jwong",
		require => Exec["ghar-install"],
	}
	
}

define ghar-add( $location ) {
	exec { "ghar-add-${location}":
		command => "ghar add ${location}",
		path    => ["/usr/local/bin/", "/bin/", "/usr/bin/", "/home/jwong/ghar/bin/"],
		require => Vcsrepo["/home/jwong/ghar"],
		user => jwong,
		group => "jwong",
	}
}