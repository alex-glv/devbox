class initial {
  package {"git":
    ensure => "installed",
  }
}

include initial
include docker
include python
