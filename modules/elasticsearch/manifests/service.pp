class elasticsearch::service {
    require elasticsearch::package
    service { "elasticsearch":
        ensure => running,
        enable => true,
    }
}
