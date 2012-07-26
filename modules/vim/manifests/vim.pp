class vim::vim {
	
	$basepackages = [ "vim" ]
	package { $basepackages: ensure => "latest" }
	
}
