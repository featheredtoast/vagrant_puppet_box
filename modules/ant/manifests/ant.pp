class ant::ant {
	$basepackages = [ "default-jdk","ant",]
	package { $basepackages: ensure => "latest" }
}