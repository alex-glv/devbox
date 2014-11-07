class user {
  user {"vagrant":
    shell      => '/bin/zsh',
    before => File["/home/vagrant/.zshrc"],
    groups => [docker]
  }
  file { "/home/vagrant/.zshrc":
    owner => vagrant,
    group => vagrant,
    source => "puppet:///modules/user/.zshrc",
  }
  file { "/home/vagrant/bin":
    ensure => "directory"
  }

  file {"/home/vagrant/bin/lein":
    ensure => "file",
    source => "/tmp/misc/lein",
    require => [File["/home/vagrant/bin"]],
    owner => "vagrant",
    group => "vagrant",
    mode => 755
    } ->
    exec {"run-lein":
      command => "/home/vagrant/bin/lein",
    }
}
