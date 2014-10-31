class docker {
  exec { "add-docker-key":
    command => "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9",
    path => "/bin:/usr/bin:/usr/sbin",
    before => Exec["apt-get update"],
    require => [Exec["apt-key net-update"], Package["apt-transport-https"]]
  }
  exec {"apt-key net-update":
    command => "apt-key net-update",
    path => "/bin:/usr/bin/:/sbin",
    returns => [0, 1] #ignore return code, it can be 1
  }    
  file { "/etc/apt/sources.list.d/docker.list":
    source => "puppet:///modules/docker/docker.list",
    before => Exec["add-docker-key"],
    owner => root
  }
  package {"lxc-docker":
    ensure => "installed",
    require => Exec['apt-get update'],
  }
  package {"apt-transport-https":
    ensure => "installed"
  }
  exec {"apt-get update":
    command => "apt-get -y update",
    path => "/bin:/usr/bin:/sbin"
  }
}
