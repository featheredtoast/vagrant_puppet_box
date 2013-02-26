class mysql::service {
	
    require mysql::package
    include mysql::config

	service { "mysql":
		enable => true,
		ensure => running,
	}
	
	exec { "set-mysql-password":
		unless => "mysqladmin -uroot -p$mysql::config::mysql_password status",
		path => ["/bin", "/usr/bin"],
		command => "mysqladmin -uroot password $mysql::config::mysql_password",
		require => Service["mysql"],
	}
	
}

