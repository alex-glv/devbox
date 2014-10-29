include apt
class devbox {

  apt_key { 'docker':
    ensure => 'present',
    id     => '36A1D7869245C8950F966E92D8576A8BA88D21E9',
  }
  package {"lxc-docker":
    ensure => "installed"
  }

}
