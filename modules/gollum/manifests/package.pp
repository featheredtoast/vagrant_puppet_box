class gollum::package {
    require ruby
    $basepackages = [ "libxslt-dev","libxml2-dev"]
    package { $basepackages: ensure => "latest" }
}
