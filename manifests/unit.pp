# Create CoreOS unit files
define coreos::unit (
$description  = $name,
$after        = undef,
$requires     = undef,
$wants        = undef,
$execstart    = undef,
$execstartpre = undef,
$restartsec   = undef,
$restart      = undef,
){
  concat { "/etc/systemd/system/$name.service":
    ensure  => file,
    owner   => "0",
    group   => "0",
    mode    => "0644",
    notify  => Exec[systemctl reload]
  }
  concat::fragment { "$name_unit":
    target  => "/etc/systemd/system/$name.service",
    content => template('coreos/unit.template.erb'),
    order   => '01'
  }
  concat::fragment { "$name_service":
    target  => "/etc/systemd/system/$name.service",
    content => template('coreos/service.template.erb'),
    order   => '99'
  }

  exec { 'systemctl reload':
    command     => '/usr/bin/systemctl daemon-reload',
    user        => "0",
    refreshonly => true
  }

}
