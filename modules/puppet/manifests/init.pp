class puppet{
	$basepackages = [ "puppet",]
	package { $basepackages: ensure => "latest" }
}
