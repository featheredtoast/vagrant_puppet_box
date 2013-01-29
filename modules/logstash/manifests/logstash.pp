class logstash::logstash{
    $basepackages = [ "ruby", "ruby-dev", "wget", "make", "g++"]
    package { $basepackages: ensure => "latest" }
    package { 'bundler':
        ensure   => 'installed',
        provider => 'gem',
    }
    file { "/logstash.sh":
            owner => "root", group => "root",
            source => "puppet:///modules/logstash/logstash.sh",
            require => Package [$basepackages]
    }
    file { "/home/vagrant/logstash-shipper.conf":
            owner => "vagrant", group => "vagrant",
            source => "puppet:///modules/logstash/logstash-shipper.conf",
    }
    file { "/home/vagrant/logstash-indexer.conf":
            owner => "vagrant", group => "vagrant",
            source => "puppet:///modules/logstash/logstash-indexer.conf",
    }
    exec { "setup" :
            path => ["/bin", "/usr/bin"],
            command => "sudo /logstash.sh",
            require => File["/logstash.sh"],
            creates => "/home/vagrant/logstash.jar"
    }
}
