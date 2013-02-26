class vim {
	
	$basepackages = [ "vim" ]
	package { $basepackages: ensure => "latest" }
	
}
