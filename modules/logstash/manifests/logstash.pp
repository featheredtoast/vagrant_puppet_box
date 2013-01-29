class logstash::logstash{
    $basepackages = [ "ruby"]
    package { $basepackages: ensure => "latest" }

    file { "/home/vagrant/logstash.jar":
        ensure => "present",
        source => [
            "https://logstash.objects.dreamhost.com/release/logstash-1.1.9-monolithic.jar",
        ],
    }
    file { "/home/vagrant/rabbitmq.tar.gz":
        ensure => "present",
        source => [
            "http://www.rabbitmq.com/releases/rabbitmq-server/v3.0.1/rabbitmq-server-generic-unix-3.0.1.tar.gz",
        ],
    }
    file { "/home/vagrant/elasticsearch.tar.gz":
        ensure => "present",
        source => [
            "http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.4.tar.gz",
        ],
    }
    file { "/home/vagrant/kibana.tar.gz":
        ensure => "present",
        source => [
            "https://github.com/rashidkpc/Kibana/archive/v0.2.0.tar.gz",
        ],
    }
}
