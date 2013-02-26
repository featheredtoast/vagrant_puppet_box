class mysql::package {
	
	$basepackages = [ "mysql-client", "mysql-server"]
	package { $basepackages: ensure => "latest" }
	
}

