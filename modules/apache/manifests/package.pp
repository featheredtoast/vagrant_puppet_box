class apache::package {
	
	$basepackages = [ "apache2"]
	package { $basepackages: ensure => "latest" }

}
