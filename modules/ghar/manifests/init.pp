class ghar($user, $repositories){
	class {'ghar::ghar':
		user => "${user}",
		repositories => $repositories,
	}
}