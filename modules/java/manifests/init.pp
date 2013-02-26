class java {
	$basepackages = [ "default-jdk"]
	package { $basepackages: ensure => "latest" }
}
