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
}
