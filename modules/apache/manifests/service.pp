class apache::service {
    require apache::package
	service { "apache2":
		ensure => running,
	}
	
}
