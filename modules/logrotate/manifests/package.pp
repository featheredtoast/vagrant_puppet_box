class logrotate::package {
	$basepackages = [ "logrotate" ]
	package { $basepackages: ensure => "latest" }
}
