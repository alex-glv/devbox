class docker {
  exec { "add_docker":
    command => "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9",
    path => "/bin:/usr/bin:/usr/sbin",
  }
  file { "/etc/apt/sources.list.d/docker.list":
    source => "puppet:///modules/docker/docker.list",
    before => Package["lxc-docker"],
  }
  package {"lxc-docker":
    ensure => "installed",
  }
}
