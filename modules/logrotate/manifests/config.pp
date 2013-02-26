class logrotate::config {
	
    require logrotate::package
    file { "/etc/logrotate.d/luz.logrotate":
        mode    => 644,
        owner   => "root",
        group   => "root",
        require => Package["logrotate"],
        source => "puppet:///modules/logrotate/luz.logrotate",
    }
	
}
