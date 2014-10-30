class user {
  user {"vagrant":
    shell      => '/bin/zsh',
    before => File["/home/vagrant/.zshrc"]
  }
  file { "/home/vagrant/.zshrc":
    owner => vagrant,
    group => vagrant,
    source => "puppet:///modules/user/.zshrc",
  }
  file { "/home/vagrant/.ssh/id_rsa":
    source => "puppet:///modules/user/id_rsa",
    mode => 600,
  }
  file { "/home/vagrant/.ssh/id_rsa.pub":
    source => "puppet:///modules/user/id_rsa.pub",
    mode => 600,
  }
}
