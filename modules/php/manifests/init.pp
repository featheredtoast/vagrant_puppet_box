class php{
	
	$basepackages = [ "libapache2-mod-php5","libapache2-mod-auth-mysql", 
	"php5","php5-cli","php5-common","php5-mysql","php5-ldap","php5-curl","php5-gd","php5-mcrypt","phpunit",
	"php-net-ftp","libssh2-php"]
	package { $basepackages: ensure => "latest" }

}
