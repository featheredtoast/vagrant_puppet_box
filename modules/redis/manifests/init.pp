class redis{
    require make

    exec { "install-redis":
        command => "wget http://redis.googlecode.com/files/redis-2.6.10.tar.gz -O /usr/share/redis.tar.gz; tar -zxvf /usr/share/redis.tar.gz -C /usr/share/; cd /usr/share/redis-2.6.10; make; make install",
        creates => "/usr/share/redis-2.6.10",
        path => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin"],
    }

    file { "/etc/init/redis-server.conf":
        ensure => "present",
        source => "puppet:///modules/redis/redis-server.conf",
    }

    service{'redis-server':
        ensure => running,
        enable => true,
        require => [File['/etc/init/redis-server.conf'],Exec['install-redis']],
    }
}
