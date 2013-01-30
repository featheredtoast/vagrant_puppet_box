node "toybox.test" {
	include apt
    include baseclass
	include user
	include git
	include vim
	include python
    include puppet
	class {'ghar':
		user => 'vagrant',
		repositories => ["https://github.com/awole20/dotfiles.git"],
	}
}

node "toybox2.test" {
	include apt
    include baseclass
	include user
	include git
	include vim
	include python
    include puppet
	class {'ghar':
		user => 'vagrant',
		repositories => ["https://github.com/awole20/dotfiles.git"],
	}
}

