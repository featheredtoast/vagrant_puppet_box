class erlang::erlang {
	
	$basepackages = [ "erlang","erlang-manpages" ]
	package { $basepackages: ensure => "latest" }
	
}
