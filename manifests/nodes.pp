node default {
    include apt
    include baseclass
    include git
    include vim
    include kibana
    include gollum
    include mylogstash::indexer
    include mylogstash::logrotate
    include "user::jwong"
    include sudo
}
