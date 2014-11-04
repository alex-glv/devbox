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
  exec {"add-go-repository":
    command => "add-apt-repository ppa:duh/golang",
    path => "/usr/sbin:/usr/bin",
    before => Package["golang"]
  }
  exec {"apt-get update":
    command => "apt-get -y update",
    path => "/bin:/usr/bin:/sbin"
  }
  package {"golang":
    ensure => "installed",
    require => Exec["apt-get update"]
  }
}

include initial
include docker
include python
include user
include dns
include nginx
