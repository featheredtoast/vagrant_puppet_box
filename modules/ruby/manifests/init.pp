class ruby{
	$basepackages = [ "ruby", "ruby-dev", "rubygems"]
	package { $basepackages: ensure => "latest" }
}
