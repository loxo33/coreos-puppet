# Create CoreOS unit files
define coreos::unit(
$description  = $name,
$after        = undef,
$requires     = undef,
$wants        = undef,
$execstart,
$execstartpre = undef,
$restartsec,
$restart,
$wantedby     = undef,
){
  file {"/etc/systemd/system/${name}.service":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('coreos/unit.template.erb'),
    notify  => Exec['systemctl reload']
  }
  exec { 'systemctl reload':
    command     => 'systemctl daemon-reload',
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin',
    user        => 0,
    refreshonly => true
  }
}
