class git::git {
	$basepackages = [ "git-core"]
	package { $basepackages: ensure => "latest" }
}