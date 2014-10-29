class python {
  package {"python":
    ensure => "installed",
  }
  package {"python3":
    ensure => "installed",
  }
  package {"python-pip":
    ensure => "installed",
    before => Exec["install_mkvirtualenv"]
  }
  exec {"install_mkvirtualenv":
    command => "pip install virtualenvwrapper",
    path => "/bin:/usr/bin",
  }
}
