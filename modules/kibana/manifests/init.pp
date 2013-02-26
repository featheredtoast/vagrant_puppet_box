class kibana{
    require ruby
    require "kibana::user"
    
    File {
        ensure => "present",
        owner  => "kibana",
        group  => "kibana",
        mode   => 664,
    }

    $downloadpath = "/usr/share"
    $installpath = "${downloadpath}/Kibana-0.2.0"

    exec { "install-kibana":
        command => "wget https://github.com/rashidkpc/Kibana/archive/v0.2.0.tar.gz -O ${downloadpath}/kibana.tar.gz; tar -zxvf ${downloadpath}/kibana.tar.gz -C ${downloadpath}/; cd ${installpath}; gem install bundler; bundle install",
        creates => "${installpath}",
        path => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin"],
    }

    file { "/etc/init/kibana.conf":
        ensure => "present",
        source => "puppet:///modules/kibana/kibana.conf",
    }

    file { "${installpath}/kibana":
        ensure => "present",
        source => "puppet:///modules/kibana/kibana",
        require => Exec['install-kibana'],
        mode   => 775,
    }

    file { "${installpath}/KibanaConfig.rb":
        ensure => "present",
        source => "puppet:///modules/kibana/KibanaConfig.rb",
        require => Exec['install-kibana'],
    }

    file { "/usr/bin/kibana":
        ensure => "link",
        target => "${installpath}/kibana",
    }

    #set permissions
    file { "${installpath}":
        ensure => "directory",
        require => Exec['install-kibana'],
        recurse => true,
    }
    service{'kibana':
        ensure => running,
        enable => true,
        require => [File['/etc/init/kibana.conf',"${installpath}/KibanaConfig.rb",'/usr/bin/kibana',"${installpath}/kibana"],Exec['install-kibana']],
    }
}
