# Create CoreOS unit files
define coreos::unit(
String $description  = $name,
Array  $after        = undef,
Array  $requires     = undef,
Array  $wants        = undef,
String $execstart    = undef,
Array  $execstartpre = undef,
String $execstop     = undef,
String $restartsec   = undef,
String $restart      = undef,
Array  $wantedby     = undef,
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
