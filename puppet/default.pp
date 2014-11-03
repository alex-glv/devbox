class initial {
  package {"git":
    ensure => "installed",
  }
  package {"zsh":
    ensure => "installed",
  }
  file {"/home/vagrant/sites":
    ensure => "directory"
  }
}

include initial
include docker
include python
include user
include dns
include nginx
