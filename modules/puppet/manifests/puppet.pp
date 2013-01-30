class puppet::puppet {
	$basepackages = [ "puppet", "puppetmaster",]
	package { $basepackages: ensure => "latest" }
}
