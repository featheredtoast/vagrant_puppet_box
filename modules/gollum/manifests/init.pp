class gollum {
    require ruby
    require "gollum::package"

    exec { "install-gollum":
        command => "gem install gollum --no-rdoc --no-ri",
        creates => "/usr/local/bin/gollum",
        path => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin"],
    }
}
