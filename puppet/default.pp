class initial {
  package {"git":
    ensure => "installed",
  }
  package {"zsh":
    ensure => "installed",
  }
  package {"nginx":
    ensure => "installed"
  }
  file {"/home/vagrant/sites":
    ensure => "directory"
  }
}

include initial
include docker
include python
include user
