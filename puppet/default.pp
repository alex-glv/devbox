class initial {
  package {"git":
    ensure => "installed",
  }
  package {"zsh":
    ensure => "installed",
  }
}

include initial
include docker
include python
include user
