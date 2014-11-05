class nginx {
  package {"nginx":
    ensure => "installed"
  }
  file {"/etc/nginx/sites-enabled":
    ensure => "link",
    target => "/home/vagrant/sites-enabled",
    owner => "vagrant",
    force => true,
    require => Package["nginx"]
    } ~>
    service {"nginx":
      ensure => "running",
      enable => true
    }
}
