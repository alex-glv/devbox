class dns {
  package {"bind9":
    ensure => "installed"
  }
  file {"/etc/bind/named.conf":
    source => "puppet:///modules/dns/named.conf",
    require => Package["bind9"]
  }
  file {"/etc/bind/named.conf.local":
    source => "puppet:///modules/dns/named.conf.local",
    require => Package["bind9"]
  }
  file {"/etc/bind/zones/planetarium.db":
    source => "puppet:///modules/dns/planetarium.db",
    require => Package["bind9"]
  }
  file {"/etc/bind/zones/rev.1.0.10.in-addr.arpa":
    source => "puppet:///modules/dns/rev.1.0.10.in-addr.arpa",
    require => Package["bind9"]
  }
  file {"/etc/bind/named.conf.options":
    source => "puppet:///modules/dns/named.conf.options",
    require => Package["bind9"]
  }  
}
