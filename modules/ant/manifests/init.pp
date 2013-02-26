class ant {
	$basepackages = [ "ant",]
	package { $basepackages: ensure => "latest",
        require => Class["java"],
    }

}
