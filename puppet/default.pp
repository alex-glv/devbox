class initial {
  file {"/home/vagrant/sites":
    ensure => "directory"
  }
  package {"git":
    ensure => "installed",
  }
  package {"zsh":
    ensure => "installed",
  }
  package {"mercurial":
    ensure => "installed"
  }
  package {"make":
    ensure => "installed"
  }
  package {"binutils":
    ensure => "installed"
  }
  package {"bison":
    ensure => "installed"
  }
  package {"gcc":
    ensure => "installed"
  }
  package {"build-essential":
    ensure => "installed"
  }
  exec {"build-dep-emacs":
    command => "apt-get build-dep emacs24",
    path => "/bin:/usr/bin:/sbin"
  }
  package {"curl":
    ensure => "installed",
  }
  package {"redis-server":
    ensure => "installed"
  }
  package {"default-jre":
    ensure => "installed"
  }
  exec {"apt-get update":
    command => "apt-get -y update",
    path => "/bin:/usr/bin:/sbin"
  }
  exec {"golang":
    command => "curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | zsh",
    cwd => "/home/vagrant",
    user => "vagrant",
    path => "/usr/bin:/bin",
    require => [Package["zsh"], Package["curl"], Package["git"]],
    returns => [0,1]
    } ->
    file { "/bin/gvm":
      ensure => "symlink",
      target => "/home/vagrant/.gvm/gvm"
    }
  
}

include initial
include docker
include python
include user
include dns
include nginx
