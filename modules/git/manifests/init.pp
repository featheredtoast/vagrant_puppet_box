class git {
	$basepackages = [ "git-core","gitk"]
	package { $basepackages: ensure => "latest" }
}
