node "toybox.test" {
	include apt
    include baseclass
	include user
	include git
	include vim
	include python
	include ant
	class {'ghar':
		user => 'vagrant',
		repositories => ["https://github.com/awole20/dotfiles.git"],
	}
	include erlang
}

node "toybox2.test" {
	include apt
    include baseclass
	include user
	include git
	include vim
	include python
	include ant
	class {'ghar':
		user => 'vagrant',
		repositories => ["https://github.com/awole20/dotfiles.git"],
	}
	include erlang
}

node "keyserv.test" {
	include apt
    include baseclass
	include user
	include git
	include vim
	include python
    include sks
	include ant
	class {'ghar':
		user => 'vagrant',
		repositories => ["https://github.com/awole20/dotfiles.git"],
	}
}
