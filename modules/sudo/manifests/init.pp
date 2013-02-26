class sudo{
	
	$basepackages = [ "sudo" ]
	package { $basepackages: ensure => "latest" }

    file { "/etc/sudoers.d/puppetsudoers":
        mode    => 440,
        owner   => "root",
        group   => "root",
        require => Package["sudo"],
        source => "puppet:///modules/sudo/puppetsudoers",
    }
}
