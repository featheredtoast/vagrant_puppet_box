class logstash::logstash{
    $basepackages = [ "ruby", "ruby-dev", "build-essencial", "wget"]
    package { $basepackages: ensure => "latest" }
    package { 'bundler':
        ensure   => 'installed',
        provider => 'gem',
    }
    file { "/logstash.sh":
            owner => "root", group => "root",
            source => "puppet:///modules/logstash/logstash.sh",
    }
    exec { "setup" :
            path => ["/bin", "/usr/bin"],
            command => "sudo /logstash.sh",
            require => File["/logstash.sh"],
    }
}
