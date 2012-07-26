node lucid32 {
	include apt
    include baseclass
	include git
	include vim
	# include mysql
	# include apache
	include python
	include ant
	class {'ghar':
		user => 'jwong'
	}
	include erlang
}