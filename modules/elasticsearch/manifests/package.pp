class elasticsearch::package {
    require java
	
    file { "/elasticsearch.deb":
        source => "puppet:///modules/elasticsearch/elasticsearch-0.20.4.deb",
    }

	package { "elasticsearch": ensure => "latest", 
        provider => dpkg,
        source => "/elasticsearch.deb",
        require => File["/elasticsearch.deb"],
    }

}
