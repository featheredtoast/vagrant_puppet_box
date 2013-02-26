class mylogstash {
    class {'logstash':
        provider => 'custom',
        jarfile => 'puppet:///modules/logstash/logstash-1.1.9-monolithic.jar',
        installpath => '/usr/share/',
        status => enabled,
    }
}

