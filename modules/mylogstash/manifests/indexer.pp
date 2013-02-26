class mylogstash::indexer {

    require mylogstash
    require elasticsearch
    require redis

    file { "/etc/logstash/conf.d/indexer.conf":
            owner => "root",
            source => "puppet:///modules/mylogstash/indexer.conf",
            mode => "664",
    }
	
}
