class nginx {
  package {"nginx":
    ensure => "installed"
    } ->
    file {"/home/vagrant/vagrant-hosts":
      source => "puppet:///modules/nginx/vagrant-hosts"
      } ->
      file {"/etc/nginx/sites-enabled/vagrant-hosts":
        ensure => "link",
        target => "/home/vagrant/vagrant-hosts",
        owner => "vagrant",
        require => Package["nginx"]
        } ~>
        service {"nginx":
          ensure => "running",
          enable => true
        }
}
