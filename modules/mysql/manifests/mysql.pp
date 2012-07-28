class mysql::mysql {
	
	$basepackages = [ "mysql-client", "mysql-server"]
	package { $basepackages: ensure => "latest" }
	
	service { "mysql":
		enable => true,
		ensure => running,
		require => Package["mysql-server"],
	}
	
	$mysql_password = "password"
	exec { "set-mysql-password":
		unless => "mysqladmin -uroot -p$mysql_password status",
		path => ["/bin", "/usr/bin"],
		command => "mysqladmin -uroot password $mysql_password",
		require => Service["mysql"],
	}
	
	mysqldb { "test":
        user => "root",
        password => "$mysql_password",
		require => Exec["set-mysql-password"],
    }
	
}

define mysqldb( $user, $password ) {
	exec { "create-${name}-db":
		unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
		command => "/usr/bin/mysql -uroot -p${password} -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
		require => Service["mysql"],
	}
}