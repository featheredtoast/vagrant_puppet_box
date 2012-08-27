

class apt {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  # Ensure apt is setup before running apt-get update
  # Apt::Key <| |> -> Exec["apt-update"]
  # Apt::Source <| |> -> Exec["apt-update"]

  # Ensure apt-get update has been run before installing any packages
  Exec["apt-update"] -> Package <| |>
}

class baseclass {

	$basepackages = [ "zsh", "mosh", "haveged"]
	package { $basepackages: ensure => "latest" }
	
	group { ["puppet", "admin"]:
		ensure => "present",
	}
	user { "vagrant":
	  ensure     => "present",
	  groups => ["admin"],
	  shell => "/bin/zsh",
	}
}

node default {
	include apt
    include baseclass
}
