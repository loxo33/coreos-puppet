# Create CoreOS unit files
define coreos::unit(
$description  = $name,
$after        = undef,
$requires     = undef,
$wants        = undef,
$execstart,
$execstartpre = undef,
$execstop     = undef,
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
    notify  => Class['coreos::systemctl::daemon_reload'],
  }
}
