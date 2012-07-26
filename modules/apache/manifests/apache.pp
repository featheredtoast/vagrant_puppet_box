class apache::apache {
	
	$basepackages = [ "apache2","libapache2-mod-php5","libapache2-mod-auth-mysql", "phpmyadmin",
	"php5","php5-cli","php5-common","php5-mysql","php5-ldap","php5-curl","php5-gd","php5-mcrypt","phpunit"]
	package { $basepackages: ensure => "latest" }

	service { "apache2":
		ensure => running,
		require => Package["apache2"],
	}
	
	file { "/etc/apache2/sites-available/default":
		notify  => Service["apache2"],  # this sets up the relationship
		mode    => 666,
		owner   => "root",
		group   => "root",
		require => Package["apache2"],
		source => "puppet:///modules/apache/vagrantsite",
	}
	
	file { "/etc/apache2/apache2.conf":
		notify  => Service["apache2"],
		mode    => 666,
		owner   => "root",
		group   => "root",
		require => Package["apache2","phpmyadmin"],
		source => "puppet:///modules/apache/apache2.conf",
	}
	
	file{ "/var/www":
		mode    => 777,
		require => Package["apache2"],
	}
	
}