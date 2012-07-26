class mysql::mysql {
	
	$basepackages = [ "mysql-client", "mysql-server"]
	package { $basepackages: ensure => "latest" }
	
	service { "mysql":
		enable => true,
		ensure => running,
		require => Package["mysql-server"],
	}
	
	file { "/etc/mysql/my.cnf":
		owner => "root", group => "root",
		source => "puppet:///modules/mysql/my.cnf",
		mode    => "0644",
		notify => Service["mysql"],
		require => Package["mysql-server"],
	}
	
	$mysql_password = "password"
	exec { "set-mysql-password":
		unless => "mysqladmin -uroot -p$mysql_password status",
		path => ["/bin", "/usr/bin"],
		command => "mysqladmin -uroot password $mysql_password",
		require => Service["mysql"],
	}
	
	mysqldb { "AURORA":
        user => "root",
        password => "$mysql_password",
		require => Exec["set-mysql-password"],
    }
	
	mysqldbremote { "mysql-remote":
		user => "root",
        password => "$mysql_password",
		require => Mysqldb["AURORA"],
	}
	
}

define mysqldb( $user, $password ) {
	exec { "create-${name}-db":
		unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
		command => "/usr/bin/mysql -uroot -p${password} -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
		require => Service["mysql"],
	}
}

define mysqldbremote( $user, $password ) {
	exec { "grant-access-${name}-db":
		command => "/usr/bin/mysql -uroot -p${password} -e \"update mysql.user set host='%' where user='${user}' and host='localhost';flush privileges;\"",
		require => Service["mysql"],
	}
}