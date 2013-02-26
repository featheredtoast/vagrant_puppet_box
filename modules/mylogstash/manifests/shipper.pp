class mylogstash::shipper{

    require mylogstash
    file { "/etc/logstash/conf.d/shipper.conf":
            owner => "root",
            source => "puppet:///modules/mylogstash/shipper.conf",
            mode => 664,
    }
	
}
