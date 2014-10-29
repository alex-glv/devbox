class initial {
  package {"git":
    ensure => "installed"
  }
}

include initial
include devbox
