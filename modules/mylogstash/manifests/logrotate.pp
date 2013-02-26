class mylogstash::logrotate {

    require mylogstash::indexer
    file { "/etc/cron.daily/logstash-elasticsearch-logrotate.sh":
            owner => "root",
            source => "puppet:///modules/mylogstash/logstash-elasticsearch-logrotate.sh",
            mode => "755",
    }
	
}
