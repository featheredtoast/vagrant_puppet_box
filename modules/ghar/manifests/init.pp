class ghar($user){
	class {'ghar::ghar':
		user => "${user}"
	}
}